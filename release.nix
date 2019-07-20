# <...> used in hydra build ci
{ pkgs ? import <nixpkgs> { }
, numpy-src ? <numpy>
, scipy-src ? <scipy>
, pandas-src ? <pandas>
, numba-src ? <numba>
, matplotlib-src ? <matplotlib>
, sympy-src ? <sympy>
, dask-src ? <dask>
}:

let
  pythonPackages = pkgs.python3Packages.override {
    overrides = import ./overrides.nix {
      inherit numpy-src scipy-src pandas-src numba-src matplotlib-src sympy-src dask-src;
    };
  };
in {
  numpy = pythonPackages.numpy;
  scipy = pythonPackages.scipy;
  pandas = pythonPackages.pandas;
  numba = pythonPackages.numba;
  matplotlib = pythonPackages.matplotlib;
  sympy = pythonPackages.sympy;
  dask = pythonPackages.dask;

  # downstream packages
  astropy = pythonPackages.astropy;
  awkward = pythonPackages.awkward;
  scikitimage = pythonPackages.scikitimage;
  scikitlearn = pythonPackages.scikitlearn;
  seaborn = pythonPackages.seaborn;
  sparse = pythonPackages.sparse;
  statsmodels = pythonPackages.statsmodels;
  xarray = pythonPackages.xarray;
  xgboost = pythonPackages.xgboost;
}
