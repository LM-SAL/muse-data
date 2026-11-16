# muse-data

Example data for [muse](https://github.com/LM-SAL/muse), stored as release assets.
Keep data files out of git.

- `dev`: the data of muse's main branch, which development versions download.
- `stable`: the data of the latest muse release, which releases download.

Older releases of muse may no longer find their data.

## Adding or updating data

With an authenticated [GitHub CLI](https://cli.github.com/), run:

```bash
./upload_data.sh file1.nc file2.tar.gz
```

Archive Zarr stores and other folders as a single `.tar.gz` file before uploading.
The script replaces the files of the same name in `dev` and prints their SHA-256
hashes for `_REGISTRY` in `muse/data/__init__.py`.

## At a muse release

```bash
./upload_data.sh --release
```

copies every `dev` file to `stable`.
