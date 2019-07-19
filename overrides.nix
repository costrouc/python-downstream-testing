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

    buildInputs = oldAttrs.buildInputs ++ [ super.cython ];

    src = scipy-src;
  });


  numba = super.numba.overrideAttrs (oldAttrs: {
    name = "${oldAttrs.pname}-master";

    src = numba-src;

    # because versioneer.py is not run on git repo
    configurePhase = oldAttrs.configurePhase + ''
      cat > numba/_version.py <<EOL
      def get_versions(default={}, verbose=False):
          return {'version': '0.45.0'}
      EOL
    '';
  });

  pandas = super.pandas.overrideAttrs (oldAttrs: {
    name = "${oldAttrs.pname}-master";

    src = pandas-src;

    # because versioneer.py is not run on git repo
    configurePhase = oldAttrs.configurePhase + ''
      cat > pandas/_version.py <<EOL
      def get_versions(default={}, verbose=False):
          return {'version': '0.25.0'}
      EOL
    '';
  });

  dask = super.dask.overrideAttrs (oldAttrs: {
    name = "${oldAttrs.pname}-master";

    src = dask-src;

    # because versioneer.py is not run on git repo
    configurePhase = oldAttrs.configurePhase + ''
      cat > dask/_version.py <<EOL
      def get_versions(default={}, verbose=False):
          return {'version': '2.1.0'}
      EOL
    '';
  });

  matplotlib = super.dask.overrideAttrs (oldAttrs: {
    name = "${oldAttrs.pname}-master";

    src = matplotlib-src;

    # because versioneer.py is not run on git repo
    configurePhase = oldAttrs.configurePhase + ''
      cat > lib/matplotlib/_version.py <<EOL
      def get_versions(default={}, verbose=False):
          return {'version': '3.1.1'}
      EOL
    '';
  });

  sympy = super.dask.overrideAttrs (oldAttrs: {
    name = "${oldAttrs.pname}-master";

    src = sympy-src;
  });

}
