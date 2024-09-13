#!/usr/bin/env bash
# Run tests for all code directories in the repository using cargo test.
for DIR in */; do
    DIRNAME=$(basename "$DIR")
    echo "==> $DIRNAME <=="
    (cd $DIR && cargo test)
done
echo "Tests complete."