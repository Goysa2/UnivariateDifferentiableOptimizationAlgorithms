if !("Optimize" in keys(Pkg.installed()))
    Pkg.clone("https://github.com/JuliaSmoothOptimizers/Optimize.jl.git")
	Pkg.build("Optimize")
end

if !("NLPModels" in keys(Pkg.installed()))
    Pkg.add("NLPModels")
	Pkg.add("ForwardDiff")
	Pkg.add("MathProgBase")
	Pkg.add("JuMP")
	Pkg.build("NLPModels")
	Pkg.build("ForwardDiff")
	Pkg.build("MathProgBase")
	Pkg.build("JuMP")
end

if !("Plots" in keys(Pkg.installed()))
    Pkg.add("Plots")
	Pkg.build("Plots")
end

if !("LSDescentMethods" in keys(Pkg.installed()))
    Pkg.clone("https://github.com/vepiteski/LSDescentMethods.git")
	Pkg.build("LSDescentMethods")
end

if !("Stopping" in keys(Pkg.installed()))
    Pkg.clone("https://github.com/vepiteski/Stopping.jl.git")
	Pkg.build("Stopping")
end

if !("OptimizationProblems" in keys(Pkg.installed()))
    Pkg.clone("https://github.com/JuliaSmoothOptimizers/OptimizationProblems.jl.git")
	Pkg.build("OptimizationProblems")
end

if !("LineSearch" in keys(Pkg.installed()))
    Pkg.clone("https://github.com/Goysa2/LineSearch.git")
	Pkg.build("LineSearch")
end

if !("ScalarSolvers" in keys(Pkg.installed()))
    Pkg.clone("https://github.com/Goysa2/ScalarSolvers.git")
	Pkg.build("ScalarSolvers")
end

if !("LineSearches" in keys(Pkg.installed()))
    Pkg.clone("https://github.com/JuliaNLSolvers/LineSearches.jl.git")
    Pkg.build("LineSearches")
end


Pkg.update()
