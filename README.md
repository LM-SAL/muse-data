# muse-data

Sample and test data for [muse](https://github.com/LM-SAL/muse), stored as
release assets. Keep data files out of git.

## Adding or updating data

With an authenticated [GitHub CLI](https://cli.github.com/), run:

```bash
./upload_data.sh file1.nc file2.tar.gz
```

Archive Zarr stores as a single `.tar.gz` file before uploading.

The script creates the `v1` release if needed, replaces assets with matching
names, and prints their download URLs and SHA-256 hashes.

Update the URLs and SHA-256 hashes in `_REGISTRY` in `muse/data/__init__.py`
when adding or changing a file.
