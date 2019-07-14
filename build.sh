DEPENDANTS="sparse scipy"

for package in $DEPENDANTS; do
    nix-build -A $package
done
