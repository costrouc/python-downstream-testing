let repoTarball = {owner, repo, branch}: (builtins.fetchTarball "https://github.com/${owner}/${repo}/archive/${branch}.tar.gz");
in
import ./release.nix {
  pkgs = import (repoTarball { owner = "nixos"; repo = "nixpkgs-channels"; branch = "nixos-unstable"; }) { };
  numpy-src = repoTarball { owner = "numpy"; repo = "numpy"; branch = "master"; };
  scipy-src = repoTarball { owner = "scipy"; repo = "scipy"; branch = "master"; };
  pandas-src = repoTarball { owner = "matplotlib"; repo = "matplotlib"; branch = "master"; };
  numba-src = repoTarball { owner = "numba"; repo = "numba"; branch = "master"; };
  matplotlib-src = repoTarball { owner = "matplotlib"; repo = "matplotlib"; branch = "master"; };
  sympy-src = repoTarball { owner = "sympy"; repo = "sympy"; branch = "master"; };
  dask-src = repoTarball { owner = "dask"; repo = "dask"; branch = "master"; };
}
