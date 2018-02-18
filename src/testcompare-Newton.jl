# using Optimize
# using NLPModels
#
# using Plots
# pyplot()

n_min = 2
n_max = 200

# Math Prog Base collection
# include("MPBProblems.jl")
test_probs = mpb_probs

# Select solvers
# using LineSearch
# using Stopping
# using LSDescentMethods


#stop_norm = ARCTR.stop_norm
atol = 1.0e-5
rtol = 1.0e-10

solvers = [Newton, Newton, Newton, Newton, Newton]
labels = ["Newton Armijo backtracking";"Newton HZ"; "Newton MT"; "Newton TR_SecA"; "Newton TR_Nwt"]

stp = TStopping(atol = atol, rtol = rtol, max_iter = 1000000, max_eval = 1000000, max_time = 100.0)

options = [Dict{Symbol,Any}(:verbose=>false, :stp => stp, :linesearch => Newarmijo_wolfe)
           Dict{Symbol,Any}(:verbose=>false, :stp => stp, :linesearch => _hagerzhang2!)#, :τ₀ => 0.01, :mayterminate => true, :τ₁ => 0.1)
           Dict{Symbol,Any}(:verbose=>false, :stp => stp, :linesearch => _morethuente2!)#, :τ₀ => 0.01, :τ₁ => 0.1)
           Dict{Symbol,Any}(:verbose=>false, :stp => stp, :linesearch => TR_SecA_ls, :τ₀ => 0.000932010000000, :τ₁ => 0.206998804000000)
           Dict{Symbol,Any}(:verbose=>false, :stp => stp, :linesearch => TR_Nwt_ls, :τ₀ => 0.200018755000000, :τ₁ => 0.999996368310000)
           ]

# include("compare_solvers.jl")

P5 = compare_solvers_with_options2(solvers, options, labels, test_probs, n_min, n_max, printskip = false)[2]
