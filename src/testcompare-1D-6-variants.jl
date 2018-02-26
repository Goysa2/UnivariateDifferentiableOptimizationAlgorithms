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
solvers = [TR_Sec, TR_SecA, bissect_sec, ARC_SecA, bissect_nwt, ARC_Sec]
labels = ["TR_Sec"; "TR_SecA"; "bissect_sec"; "ARC_SecA"; "bissect_nwt"; "ARC_Sec"]

options = [Dict{Symbol,Any}(:verbose=>false)
           Dict{Symbol,Any}(:verbose=>false)
           Dict{Symbol,Any}(:verbose=>false)
           Dict{Symbol,Any}(:verbose=>false)
           Dict{Symbol,Any}(:verbose=>false)
           Dict{Symbol,Any}(:verbose=>false)
           ]

include("compare_solvers.jl")

# s1, P1, t1, Pt1 = compare_solvers_with_options2(solvers, options, labels, test_probs, n_min, n_max, printskip = false)
P2 = compare_solvers_with_options2(solvers, options, labels, test_probs, n_min, n_max, printskip = false)[2]
