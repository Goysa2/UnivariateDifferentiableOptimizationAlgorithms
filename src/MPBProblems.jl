
using OptimizationProblems


probs = filter(name -> name != :OptimizationProblems
               && name != :penalty2
               && name != :penalty3
               , names(OptimizationProblems))

mpb_probs = (MathProgNLPModel(eval(p)(n_max),  name=string(p) )   for p in probs)
