# UnivariateDifferentiableOptimizationAlgorithms

This package is designed to reproduce the results (the performance profiles)
presented in the article Univariate differentiable optimization algorithms and
linesearch computation.

## How to install
`Pkg.clone("https://github.com/Goysa2/UnivariateDifferentiableOptimizationAlgorithms.git")`

## How to use
Open a terminal in .julia/v0.6/UnivariateDifferentiableOptimizationAlgorithms/src .
In order to install all necessary packages, run `include("install.jl")`.  Now to
produce the different performance profiles, you simply need to includes one the
different scripts: `include("testcompare-1D.jl")`,
`include("testcompare-1D-6-variants.jl")`, `include("testcompare-CG-HZ.jl")`,
`include("testcompare-Newton.jl")`, `include("testcompare-L-BFGS.jl")`


## Note on Plotting
We used PyPlot to handle the plotting, but differents plotting backends will
produce the performance profile.

[![Build Status](https://travis-ci.org/Goysa2/UnivariateDifferentiableOptimizationAlgorithms.jl.svg?branch=master)](https://travis-ci.org/Goysa2/UnivariateDifferentiableOptimizationAlgorithms.jl)

[![Coverage Status](https://coveralls.io/repos/Goysa2/UnivariateDifferentiableOptimizationAlgorithms.jl/badge.svg?branch=master&service=github)](https://coveralls.io/github/Goysa2/UnivariateDifferentiableOptimizationAlgorithms.jl?branch=master)

[![codecov.io](http://codecov.io/github/Goysa2/UnivariateDifferentiableOptimizationAlgorithms.jl/coverage.svg?branch=master)](http://codecov.io/github/Goysa2/UnivariateDifferentiableOptimizationAlgorithms.jl?branch=master)
