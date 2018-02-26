using Optimize
using NLPModels

using Plots
# pyplot()

# select problem collection

n_min = 2
n_max = 200

TestCUTEst = false

# Math Prog Base collection
include("MPBProblems.jl")
test_probs = mpb_probs

using LineSearch
using Stopping
using LSDescentMethods

#stop_norm = ARCTR.stop_norm
atol = 1.0e-5
rtol = 1.0e-10

solvers = [Newlbfgs, Newlbfgs, Newlbfgs, Newlbfgs, Newlbfgs]

labels = ["L-BFGS Armijo backtracking";"L-BFGS HZ"; "L-BFGS MT"; "L-BFGS TR_SecA"; "L-BFGS TR_Nwt"]

#labels[2] = string(labels[2],"Monotone")
stp = TStopping(atol = atol, rtol = rtol, max_iter = 1000000, max_eval = 1000000, max_time = 100.0)

options = [Dict{Symbol,Any}(:verbose=>false, :stp => stp, :linesearch => Newarmijo_wolfe)
           Dict{Symbol,Any}(:verbose=>false, :stp => stp, :linesearch => _hagerzhang2!)#, :τ₀ => 0.01, :mayterminate => true, :τ₁ => 0.1)
           Dict{Symbol,Any}(:verbose=>false, :stp => stp, :linesearch => _morethuente2!)#, :τ₀ => 0.01, :τ₁ => 0.1)
           Dict{Symbol,Any}(:verbose=>false, :stp => stp, :linesearch => TR_SecA_ls)#, :τ₀ => 0.0001, :τ₁ => 0.6)
           Dict{Symbol,Any}(:verbose=>false, :stp => stp, :linesearch => TR_Nwt_ls, :τ₀ => 0.329000000011452, :τ₁ => 0.9569998999975)
           ]

include("compare_solvers.jl")
P3 = compare_solvers_with_options2(solvers, options, labels, test_probs, n_min, n_max, printskip = false)[2]
