self: super: {
  numpy = super.numpy.overrideAttrs (oldAttrs: {
    name = "${oldAttrs.pname}-master";

    buildInputs = oldAttrs.buildInputs ++ [ super.cython ];

    src = <numpy>;
  });

  numba = super.numba.overrideAttrs (oldAttrs: {
    name = "${oldAttrs.pname}-master";

    configurePhase = oldAttrs.configurePhase + ''
      cat > numba/_version.py <<EOL
      version_version = '0.45.0'
      version_full = '7e2fa9823c1fbf94091ae6024b4cbf04d914581c'
      def get_versions(default={}, verbose=False):
          return {'version': version_version, 'full': version_full}
      EOL
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
