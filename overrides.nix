{ numpy-src
, scipy-src
, pandas-src
, numba-src
, matplotlib-src
, sympy-src
, dask-src
}:

self: super: {
  numpy = super.numpy.overrideAttrs (oldAttrs: {
    name = "${oldAttrs.pname}-master";

    buildInputs = oldAttrs.buildInputs ++ [ super.cython ];

    src = numpy-src;
  });

  scipy = super.scipy.overrideAttrs (oldAttrs: {
    name = "${oldAttrs.pname}-master";

    buildInputs = oldAttrs.buildInputs ++ [ super.cython super.pybind11 ];

    buildPhase = ''
      export HOME=$(mktemp -d)
    '' + oldAttrs.buildPhase;

    src = scipy-src;
  });

  numba = super.numba.overrideAttrs (oldAttrs: {
    name = "${oldAttrs.pname}-master";

    src = numba-src;

    # because versioneer.py is not run on git repo
    configurePhase = oldAttrs.configurePhase + ''
      subsituteInPlace setup.py \
        --replace "version=versioneer.get_version()" "version='0.45.0'"
    '';
  });

  pandas = super.pandas.overrideAttrs (oldAttrs: {
    name = "${oldAttrs.pname}-master";

    src = pandas-src;

    # because versioneer.py is not run on git repo
    configurePhase = oldAttrs.configurePhase + ''
      subsituteInPlace setup.py \
        --replace "version=versioneer.get_version()" "version='0.25.0'"
    '';
  });

  dask = super.dask.overrideAttrs (oldAttrs: {
    name = "${oldAttrs.pname}-master";

    src = dask-src;

    # because versioneer.py is not run on git repo
    configurePhase = oldAttrs.configurePhase + ''
      subsituteInPlace setup.py \
        --replace "version=versioneer.get_version()" "version='2.1.0'"
    '';
  });

  matplotlib = super.matplotlib.overrideAttrs (oldAttrs: {
    name = "${oldAttrs.pname}-master";

    src = matplotlib-src;

    # because versioneer.py is not run on git repo
    configurePhase = oldAttrs.configurePhase + ''
      subsituteInPlace setup.py \
        --replace "version=versioneer.get_version()" "version='3.1.1'"
    '';
  });

  sympy = super.sympy.overrideAttrs (oldAttrs: {
    name = "${oldAttrs.pname}-master";

    src = sympy-src;
  });

}
