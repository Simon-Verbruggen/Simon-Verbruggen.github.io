using BEAST, CompScienceMeshes
using SphericalScattering
using LinearAlgebra
using Makeitso
using PlotlyJS
const CSM = CompScienceMeshes
using DrWatson

# start with the definiton of the needed physical properties:
c = 2.99792458e8      #speed of light
f = 1/2*c             #frequency
κ = 2π * f / c        #wavenumber
μ = 4π * 1e-7
η = 1.0

save_path = projectdir("assets/htmls/")

@target wire_frame_sphere (;h) -> begin
    Γ = CSM.gmshsphere(1.0, h; order=2)
    plt = PlotlyJS.plot(wireframe(Γ), Layout(scene = attr(xaxis = attr(visible=false), yaxis = attr(visible=false), zaxis = attr(visible=false),
    camera = attr(eye = attr(x=0.76, y=0.76, z=0.76)))))
    PlotlyJS.savefig(plt, save_path * "wireframe_sphere.html")
end

@target solution_efie (;h) -> begin
    Γ = CSM.gmshsphere(1.0, h; order=2)
    X = BEAST.gwpdiv(Γ; order=0)

    T = Maxwell3D.singlelayer(wavenumber=κ)

    E = Maxwell3D.planewave(direction=ẑ, polarization=x̂, wavenumber=κ);
    e = (n × E) × n;

    qs_t = BEAST.DoubleNumSauterQstrat(4,5,6,6,6,6)
    qs_e = BEAST.SingleNumQStrat(12)

    bx = assemble(e,X; quadstrat=qs_e)
    A = assemble(T,X,X; quadstrat=qs_t); 

    iA = BEAST.GMRES(A)
    u = -iA * bx
    u = u / (c * μ)
    u = BEAST.FEMFunction(u, X)
    return (;u)
end

@target exact_trace (;h_analytical) -> begin
    # Compute the far field using the OSRC solution and compare with Mie series
    sp = PECSphere(radius=1.0)
    ex = planeWave(frequency=f)

    # Plot
    # first, construct mesh for reference solution to be plotted on

    Γ = meshsphere(1.02, h_analytical)
    Lagrange = BEAST.lagrangec0(Γ; order=1)

    positions = Lagrange.pos
    EF_norm = norm.(field(sp, ex, MagneticField(positions)))
    return (; EF_norm, Lagrange)
end

@target plot_traces (exact_trace, solution_efie) -> begin
    (; EF_norm, Lagrange) = exact_trace
    (;u) = solution_efie
    

    fcr1, geo1 = facecurrents(EF_norm, Lagrange)
    fcr2, geo2 = facecurrents(u.coeffs, u.space)
    cmin = 0.0
    cmax = maximum(norm.(fcr1))
    plt1 = PlotlyJS.plot(patch(geo1, fcr1; caxis=(cmin, cmax)))
    plt2 = PlotlyJS.plot(patch(geo2, norm.(fcr2); caxis=(cmin, cmax)))

    PlotlyJS.savefig(plt1, save_path * "mie.html")
    PlotlyJS.savefig(plt2, save_path * "efie.html")
end

h = 0.15
h_analytical = 0.02

make(wire_frame_sphere; h=h)
make(plot_traces; h=h, h_analytical=h_analytical)