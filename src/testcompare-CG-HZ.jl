using Optimize
using NLPModels

using Plots
# pyplot()
plotly()

n_min = 2
n_max = 200

TestCUTEst = false

# Math Prog Base collection
include("MPBProblems.jl")
test_probs = mpb_probs

# Select solvers
using LineSearch
using Stopping
using LSDescentMethods


#stop_norm = ARCTR.stop_norm
atol = 1.0e-5
rtol = 1.0e-10

solvers = [CG_HZ, CG_HZ, CG_HZ, CG_HZ, CG_HZ]
labels = ["CG_HZ Armijo backtracking";"CG_HZ HZ"; "CG_HZ MT"; "CG_HZ TR_SecA"; "CG_HZ TR_Nwt"]

stp = TStopping(atol = atol, rtol = rtol, max_iter = 1000000, max_eval = 1000000, max_time = 100.0)

options = [Dict{Symbol,Any}(:verbose=>false, :stp => stp, :linesearch => Newarmijo_wolfe)
           Dict{Symbol,Any}(:verbose=>false, :stp => stp, :linesearch => _hagerzhang2!, :τ₀ => 0.01, :mayterminate => true, :τ₁ => 0.1)
           Dict{Symbol,Any}(:verbose=>false, :stp => stp, :linesearch => _morethuente2!, :τ₀ => 0.01, :τ₁ => 0.1)
           Dict{Symbol,Any}(:verbose=>false, :stp => stp, :linesearch => TR_SecA_ls, :τ₀ => 0.000000010000000, :τ₁ => 0.092999999998146)
           Dict{Symbol,Any}(:verbose=>false, :stp => stp, :linesearch => TR_Nwt_ls, :τ₀ => 0.0001, :τ₁ => 0.001)
           ]

include("compare_solvers.jl")

P4 = compare_solvers_with_options2(solvers, options, labels, test_probs, n_min, n_max, printskip = false)[2]
