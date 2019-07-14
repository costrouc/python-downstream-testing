self: super: {
  numpy = super.numpy.overrideAttrs (oldAttrs: {
    name = "${oldAttrs.pname}-master";

    buildInputs = oldAttrs.buildInputs ++ [ super.cython ];

    src =  builtins.fetchGit {
      url = "git@github.com:numpy/numpy.git";
      ref = "master";
    };
  });

  numba = super.numpy.overrideAttrs (oldAttrs: {
    name = "${oldAttrs.pname}-master";

    src =  builtins.fetchGit {
      url = "git@github.com:numba/numba.git";
      ref = "master";
    };
  });


  dask = super.dask.overrideAttrs (oldAttrs: {
    name = "${oldAttrs.pname}-master";

    src =  builtins.fetchGit {
      url = "git@github.com:dask/dask.git";
      ref = "master";
    };
  });

  matplotlib = super.dask.overrideAttrs (oldAttrs: {
    name = "${oldAttrs.pname}-master";

    src =  builtins.fetchGit {
      url = "git@github.com:matplotlib/matplotlib.git";
      ref = "master";
    };
  });

}
