# Python Dependants Testing

This is a proof of concept for the SciPy conference sprints. Many
package maintainers matplotlib, numba, numpy, and others have
expressed frustration that they have a hard time testing if their
changes to master break downstream packages that depend on them.

I hope that this nix demonstration with CI can show how this would work.


# Tested Downstream Repositories

After speaking with maintainers of several projects an initial set of
packages were established.

 - dask
   - xarray
   - scikit-image
   - xgboost
   - datashader
   - stumpy
 - numba
   - umap
   - hpat
   - librosa
   - clifford
   - awkward
   - sparse
   - fastparquet
   - pygbm
 - astropy
   - astroquery
   - pyvo
   - ccdproc
   - photutils
   - sunpy
 - matplotlib
   - seaborn
   - astropy
   - pandas
   - xarray
 - sympy
   - pydy
   - yt
   - qnet
 - numpy
   - 
