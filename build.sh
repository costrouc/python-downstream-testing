DEPENDANTS="xarray scikitimage xgboost"

for package in $DEPENDANTS; do
    nix-build -A $package
done
