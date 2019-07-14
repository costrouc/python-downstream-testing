self: super: {
  numpy = super.numpy.overrideAttrs (oldAttrs: {
    name = "${oldAttrs.pname}-master";

    buildInputs = oldAttrs.buildInputs ++ [ super.cython ];

    src =  builtins.fetchTarball {
      url = "https://github.com/numpy/numpy/archive/master.tar.gz";
    };
  });


  numba = super.numba.overrideAttrs (oldAttrs: {
    name = "${oldAttrs.pname}-master";

    configurePhase = oldAttrs.configurePhase + ''
      echo "version_version = '0.44.1'" > numba/_version.py
    '';

    src =  builtins.fetchTarball {
      url = "https://github.com/numba/numba/archive/master.tar.gz";
    };
  });


  dask = super.dask.overrideAttrs (oldAttrs: {
    name = "${oldAttrs.pname}-master";

    src =  builtins.fetchTarball {
      url = "https://github.com/dask/dask/archive/master.tar.gz";
    };
  });


  matplotlib = super.dask.overrideAttrs (oldAttrs: {
    name = "${oldAttrs.pname}-master";

    src =  builtins.fetchTarball {
      url = "https://github.com/matplotlib/matplotlib/archive/master.tar.gz";
    };
  });

  sympy = super.dask.overrideAttrs (oldAttrs: {
    name = "${oldAttrs.pname}-master";

    src =  builtins.fetchTarball {
      url = "https://github.com/sympy/sympy/archive/master.tar.gz";
    };
  });

}
