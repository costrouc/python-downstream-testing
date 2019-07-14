# Python Dependants Testing

This is a proof of concept for the SciPy conference sprints. Many
package maintainers matplotlib, numba, numpy, and others have
expressed frustration that they have a hard time testing if their
changes to master break downstream packages that depend on them.

I hope that this nix demonstration with CI can show how this would work.


# Tested Downstream Repositories

 - dask
   - xarray
   - scikit-image
   - xgboost
   - datashader
   - stumpy
 - numba
