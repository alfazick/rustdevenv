#!/usr/bin/env bash
# Lint all code directories in the repository using cargo clippy.
for DIR in */; do
    DIRNAME=$(basename "$DIR")
    echo "==> $DIRNAME <=="
    (cd $DIR && cargo clippy -- -D warnings)
done
echo "Lint complete."