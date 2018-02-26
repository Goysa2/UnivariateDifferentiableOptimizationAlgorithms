using Optimize
using NLPModels

using Plots
# pyplot()

n_min = 1
n_max = 1

# Math Prog Base collection
include("MPBProblems-1D.jl")
test_probs = mpb_probs_1D

using ScalarSolvers
solvers = [bissect, bissect_Cub, bissect_nwt, bissect_sec, bissect_secA, ARC_Cub, ARC_Nwt, ARC_Sec, ARC_SecA, TR_Cub, TR_Nwt, TR_Sec, TR_SecA, zoom_Cub, zoom_Nwt, zoom_Sec, zoom_SecA]
labels = ["Biss"; "Biss_Cub"; "Biss_Nwt"; "Biss_Sec"; "Biss_SecA"; "ARC_Cub"; "ARC_Nwt"; "ARC_Sec"; "ARC_SecA"; "TR_Cub";"TR_Nwt"; "TR_Sec"; "TR_SecA"; "zoom_Cub"; "zoom_Nwt"; "zoom_Sec"; "zoom_SecA"]

options = [Dict{Symbol,Any}(:verbose=>false, :tol => 0.1)
           Dict{Symbol,Any}(:verbose=>false, :tol => 0.1)
           Dict{Symbol,Any}(:verbose=>false, :tol => 0.1)
           Dict{Symbol,Any}(:verbose=>false, :tol => 0.1)
           Dict{Symbol,Any}(:verbose=>false, :tol => 0.1)
           Dict{Symbol,Any}(:verbose=>false, :tol => 0.1)
           Dict{Symbol,Any}(:verbose=>false, :tol => 0.1)
           Dict{Symbol,Any}(:verbose=>false, :tol => 0.1)
           Dict{Symbol,Any}(:verbose=>false, :tol => 0.1)
           Dict{Symbol,Any}(:verbose=>false, :tol => 0.1)
           Dict{Symbol,Any}(:verbose=>false, :tol => 0.1)
           Dict{Symbol,Any}(:verbose=>false, :tol => 0.1)
           Dict{Symbol,Any}(:verbose=>false, :tol => 0.1)
           Dict{Symbol,Any}(:verbose=>false, :tol => 0.1)
           Dict{Symbol,Any}(:verbose=>false, :tol => 0.1)
           Dict{Symbol,Any}(:verbose=>false, :tol => 0.1)
           Dict{Symbol,Any}(:verbose=>false, :tol => 0.1)
           ]


include("compare_solvers.jl")
# s1, P1, t1, Pt1 = compare_solvers_with_options2(solvers, options, labels, test_probs, n_min, n_max, printskip = false)
P = compare_solvers_with_options2(solvers, options, labels, test_probs, n_min, n_max, printskip = false)[2]
