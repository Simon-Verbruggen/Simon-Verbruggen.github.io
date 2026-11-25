using CompScienceMeshes
using BEAST
using LinearAlgebra
using PlotlyJS
using Makeitso
using DrWatson

save_path_htmls = projectdir("assets/htmls/")
save_path_figs = projectdir("assets/figures/")

# Flat triangle mesh through the corners of a curvilinear mesh, with the same cell order
function flatmesh(m::CompScienceMeshes.CurvilinearMesh)
    corners = [c.indices[1:3] for c in cells(m)]
    used = sort(unique(reduce(vcat, corners)))
    newid = Dict(v => i for (i, v) in enumerate(used))
    faces = [CompScienceMeshes.SimplexGraph(index((newid[v] for v in c)...)) for c in corners]
    return Mesh(vertices(m)[used], faces)
end

@target geo (;h, order_elements) -> begin
    # Stanford bunny scaled to a largest dimension of 1, meshed with cubic triangles.
    # Γf is the flat mesh through the same corner points, with the same cells.
    Γ = CompScienceMeshes.meshbunny(h; order=order_elements)
    Γ.vertices .= [point(v[1], -v[3], v[2]) for v in Γ.vertices]
    zmin = minimum(v[3] for v in Γ.vertices)
    Γ.vertices .= [v - point(0, 0, zmin) for v in Γ.vertices]
    Γf = flatmesh(Γ)
    return (;Γ)
end

@target solution_efie (geo ;κ, h, order) -> begin
    (;Γ) = geo

    # define the basis functions
    X = BEAST.gwpdiv(Γ; order=order)
    @show numfunctions(X)

    # define operator and excitation
    t = Maxwell3D.singlelayer(wavenumber=κ)
    E = Maxwell3D.planewave(direction=ẑ, polarization=x̂, wavenumber=κ)
    e = (n × E) × n

    # Quadrature suitable for curved elements (cf. BEAST's examples/efie_geop2.jl)
    qt = BEAST.DoubleNumSauterQstrat(4,5,6,6,6,6)
    qe = BEAST.SingleNumQStrat(12)

    # assemble the matrix system
    A = assemble(t, X, X; threading=:cellcoloring, quadstrat=qt)
    b = assemble(e, X; quadstrat=qe)

    # solve the matrix system
    solver = BEAST.lu(A)
    u, ch = solve(solver, b)
    u = BEAST.FEMFunction(u, X)
    return (;u)
end

@target wire_frame (geo, ;h) -> begin
    (;Γ) = geo
    plt = PlotlyJS.plot(wireframe(Γ), Layout(scene = attr(xaxis = attr(visible=false), yaxis = attr(visible=false), zaxis = attr(visible=false),
    camera = attr(up=attr(x=0, y=0, z=1), eye=attr(x=-1.5, y=-1.5, z=0.5)))))
    PlotlyJS.savefig(plt, save_path_htmls * "wireframe_bunny.html")
end

@target plot_solution (solution_efie, wire_frame;κ, h, order_facecurrents) -> begin
    (;u) = solution_efie

    fcr, geo = facecurrents(u.coeffs, u.space; order=order_facecurrents)
    @show length(geo)
    plt = PlotlyJS.plot(
        patch(geo, norm.(fcr), caxis=(0,2)),
        Layout(template="plotly_white",
            scene=attr(aspectmode="data",
            camera = attr(up=attr(x=0, y=0, z=1), eye=attr(x=-1.5, y=-1.5, z=0.5)))))
    PlotlyJS.savefig(plt, save_path_htmls * "bunny_efie.html")
    plt = PlotlyJS.plot(
        patch(geo, norm.(fcr), caxis=(0,2), showscale=false),
        Layout(scene = attr(xaxis = attr(visible=false), yaxis = attr(visible=false), zaxis = attr(visible=false),
        camera = attr(up=attr(x=0, y=0, z=1), eye=attr(x=-1.5*0.7, y=-1.5*0.7, z=0.5*0.7)))))
    PlotlyJS.savefig(plt, save_path_figs * "bunny_efie.png")
end

κ, η = 6.0, 1.0
λ = 2π / κ
h = λ / 6
order_elements = 3
order_facecurrents = 5
order = 2

df = make(plot_solution; κ=κ, h=h, order=order, order_elements=order_elements, order_facecurrents=order_facecurrents)
