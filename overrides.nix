self: super: {
  numpy = super.numpy.overrideAttrs (oldAttrs: {
    name = "${oldAttrs.pname}-master";

    buildInputs = oldAttrs.buildInputs ++ [ super.cython ];

    src = <numpy>;
  });


  numba = super.numba.overrideAttrs (oldAttrs: {
    name = "${oldAttrs.pname}-master";

    configurePhase = oldAttrs.configurePhase + ''
      echo "version_version = '0.44.1'" > numba/_version.py
    '';

    src = <numba>;
  });


  dask = super.dask.overrideAttrs (oldAttrs: {
    name = "${oldAttrs.pname}-master";

    src =  <dask>;
  });


  matplotlib = super.dask.overrideAttrs (oldAttrs: {
    name = "${oldAttrs.pname}-master";

    src = <matplotlib>;
  });

  sympy = super.dask.overrideAttrs (oldAttrs: {
    name = "${oldAttrs.pname}-master";

    src = <sympy>;
  });

}
