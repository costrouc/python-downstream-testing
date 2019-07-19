self: super: {
  numpy = super.numpy.overrideAttrs (oldAttrs: {
    name = "${oldAttrs.pname}-master";

    buildInputs = oldAttrs.buildInputs ++ [ super.cython ];

    src = <numpy>;
  });

  numba = super.numba.overrideAttrs (oldAttrs: {
    name = "${oldAttrs.pname}-master";

    # because versioneer.py is not run on git repo
    configurePhase = oldAttrs.configurePhase + ''
      cat > numba/_version.py <<EOL
      def get_versions(default={}, verbose=False):
          return {'version': '0.45.0'}
      EOL
    '';

    src = <numba>;
  });

  pandas = super.pandas.overrideAttrs (oldAttrs: {
    name = "${oldAttrs.pname}-master";

    # because versioneer.py is not run on git repo
    configurePhase = oldAttrs.configurePhase + ''
      cat > pandas/_version.py <<EOL
      def get_versions(default={}, verbose=False):
          return {'version': '0.25.0'}
      EOL
    '';

    src =  <pandas>;
  });

  dask = super.dask.overrideAttrs (oldAttrs: {
    name = "${oldAttrs.pname}-master";

    # because versioneer.py is not run on git repo
    configurePhase = oldAttrs.configurePhase + ''
      cat > dask/_version.py <<EOL
      def get_versions(default={}, verbose=False):
          return {'version': '2.1.0'}
      EOL
    '';

    src =  <dask>;
  });

  matplotlib = super.dask.overrideAttrs (oldAttrs: {
    name = "${oldAttrs.pname}-master";

    # because versioneer.py is not run on git repo
    configurePhase = oldAttrs.configurePhase + ''
      cat > lib/matplotlib/_version.py <<EOL
      def get_versions(default={}, verbose=False):
          return {'version': '3.1.1'}
      EOL
    '';

    src = <matplotlib>;
  });

  sympy = super.dask.overrideAttrs (oldAttrs: {
    name = "${oldAttrs.pname}-master";

    src = <sympy>;
  });

}
