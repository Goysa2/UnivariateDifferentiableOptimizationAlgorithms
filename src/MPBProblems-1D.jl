using OptimizationProblems

probs = filter(name -> name != :OptimizationProblems
               && name != :penalty2
               && name != :penalty3
               && name != :clplatea
               && name != :clplateb
               && name != :clplatec
               , names(OptimizationProblems))

mpb_probs_1D = (MathProgNLPModel(eval(p)(n_max),  name=string(p) )   for p in probs)
