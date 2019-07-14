# Python Dependants Testing

This is a proof of concept for the SciPy conference sprints. Many
package maintainers matplotlib, numba, numpy, and others have
expressed frustration that they have a hard time testing if their
changes to master break downstream packages that depend on them.

I hope that this nix demonstration with CI can show how this would work.

# Why Nix?

Nix was designed for this work. Currently on
[nixpkgs](https://github.com/NixOS/nixpkgs/) we always test if a given
change affects downstream repositories. If you look at the [pull
requests](https://github.com/NixOS/nixpkgs/pulls) you can see
`rebuild-linux ...`. This label indicates the number of packages that
need to be rebuilt with the given change. This is not python specific
it goes for any configuration change. Examples:

 - consider changing the `llvm` version that `numba` depends on. Nix
   will know to rebuild numba and everything that depended on `numba`.
 - changing numpy to be compiler with mkl vs openblas. This will
   trigger a rebuild of all packages that depend on numpy. Note that
   we can control how many packages we want to build
   
What does a `numpy`, `scipy`, ... developer need to do to work with
this repository? **NOTHING** it just works. Right now this travis CI
job only builds the packages mentioned below. But nix can test **all**
dependent packages. See
[python-unstable](https://hydra.nixos.org/jobset/nixpkgs/python-unstable)
in nixpkgs. You can see that as of this witting at commit `e87daaa` we
have `4747` python packages successfully building and `294` broken. We
have about 5 free time maintainers on all these python packages and
would say that >70% run full tests.


# Tested Downstream Repositories

After speaking with maintainers of several projects an initial set of
packages were established. A check indicates that the package is
currently packaged in nixpkgs.

 - dask
   - [X] xarray
   - [X] scikit-image
   - [X] xgboost
   - [ ] datashader
   - [ ] stumpy
 - numba
   - umap
   - [ ] hpat
   - [X] librosa
   - [ ] clifford
   - [X] awkward
   - [X] sparse
   - [X] fastparquet
   - [ ] pygbm
 - astropy
   - [X] astroquery
   - [ ] pyvo
   - [ ] ccdproc
   - [ ] photutils
   - [ ] sunpy
 - matplotlib
   - [X] seaborn
   - [X] astropy
   - [X] pandas
   - [X] xarray
 - sympy
   - [ ] pydy
   - [ ] yt
   - [ ] qnet
 - numpy
   - [ ] pandas
   - [ ] scipy
   - [ ] matplotlib
   - [ ] scikit-learn
   - [ ] scikit-image
   - [ ] statsmodels
   - [ ] astropy
