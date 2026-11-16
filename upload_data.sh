#!/usr/bin/env bash
#
# Upload example data files to the dev release and print their _REGISTRY hashes
# for muse/data/__init__.py.
#
# Usage: ./upload_data.sh file1.nc file2.tar.gz ...
#        ./upload_data.sh --release   (at a muse release: copy every dev file to stable)

set -euo pipefail

REPO=${REPO:-LM-SAL/muse-data}

if [ "${1:-}" = "--release" ]; then
    tmp=$(mktemp -d)
    trap 'rm -rf "$tmp"' EXIT
    gh release download dev --repo "$REPO" --dir "$tmp"
    gh release upload stable "$tmp"/* --repo "$REPO" --clobber
    exit 0
fi

if [ $# -eq 0 ]; then
    echo "usage: $0 <file> [<file> ...] | --release" >&2
    exit 1
fi

gh release upload dev "$@" --repo "$REPO" --clobber

for f in "$@"; do
    echo "$(basename "$f"): sha256:$(shasum -a 256 "$f" | cut -d' ' -f1)"
done
