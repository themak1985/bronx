#!/bin/sh
set -eu

root_dir=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
dist_dir="$root_dir/dist"
artifact="$dist_dir/bronx-0.6.0.zip"
stage_dir=$(mktemp -d "${TMPDIR:-/tmp}/bronx-build.XXXXXX")

cleanup() {
  rm -rf "$stage_dir"
}
trap cleanup EXIT INT TERM

mkdir -p "$dist_dir"
mkdir -p "$stage_dir/bronx"

cp "$root_dir/info.xml" "$root_dir/bronx.php" "$root_dir/README.md" \
  "$root_dir/LICENSE" "$root_dir/CHANGELOG.md" "$stage_dir/bronx/"
cp -R "$root_dir/docs" "$root_dir/managed" "$root_dir/streams" "$stage_dir/bronx/"
rm -rf "$stage_dir/bronx/docs/screenshots"

rm -f "$artifact"
(cd "$stage_dir" && zip -qr "$artifact" bronx)

echo "Created:"
echo "  $artifact"
