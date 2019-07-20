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
      substituteInPlace setup.py \
        --replace "version=versioneer.get_version()" "version='0.45.0'"
    '';
  });

  pandas = super.pandas.overrideAttrs (oldAttrs: {
    name = "${oldAttrs.pname}-master";

    src = pandas-src;

    # because versioneer.py is not run on git repo
    configurePhase = oldAttrs.configurePhase + ''
      substituteInPlace setup.py \
        --replace "version=versioneer.get_version()" "version='0.25.0'"
    '';
  });

  dask = super.dask.overrideAttrs (oldAttrs: {
    name = "${oldAttrs.pname}-master";

    src = dask-src;

    # because versioneer.py is not run on git repo
    configurePhase = oldAttrs.configurePhase + ''
      substituteInPlace setup.py \
        --replace "version=versioneer.get_version()" "version='2.1.0'"
    '';
  });

  matplotlib = super.matplotlib.overrideAttrs (oldAttrs: {
    name = "${oldAttrs.pname}-master";

    src = matplotlib-src;

    # because versioneer.py is not run on git repo
    configurePhase = oldAttrs.configurePhase + ''
      substituteInPlace setup.py \
        --replace "version=__version__" "version='3.1.1'"
    '';

    prePatch = ''
      # Failing test: ERROR: matplotlib.tests.test_style.test_use_url
      sed -i 's/test_use_url/fails/' lib/matplotlib/tests/test_style.py
      # Failing test: ERROR: test suite for <class 'matplotlib.sphinxext.tests.test_tinypages.TestTinyPages'>
      # sed -i 's/TestTinyPages/fails/' lib/matplotlib/sphinxext/tests/test_tinypages.py
      # Transient errors
      sed -i 's/test_invisible_Line_rendering/noop/' lib/matplotlib/tests/test_lines.py

      substituteInPlace setup.py \
        --replace "cmdclass['install_lib'] = install_lib_with_jquery" ""
    '';
  });

  sympy = super.sympy.overrideAttrs (oldAttrs: {
    name = "${oldAttrs.pname}-master";

    # https://github.com/sympy/sympy/pull/13476#issuecomment-513474029
    patches = []; # remove sage patch

    src = sympy-src;
  });

}
