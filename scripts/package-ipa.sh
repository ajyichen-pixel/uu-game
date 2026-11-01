#!/usr/bin/env bash
set -euo pipefail

archive_path="${1:?Expected an .xcarchive path}"
output_path="${2:?Expected an output IPA path}"
applications_path="$archive_path/Products/Applications"
app_path="$(find "$applications_path" -maxdepth 1 -type d -name '*.app' -print -quit)"

if [[ -z "$app_path" ]]; then
  echo "No iOS app bundle was found in: $applications_path" >&2
  exit 1
fi

payload_path="$(mktemp -d)/Payload"
mkdir -p "$payload_path"
cp -R "$app_path" "$payload_path/"
mkdir -p "$(dirname "$output_path")"
ditto -c -k --sequesterRsrc --keepParent "$payload_path" "$output_path"
echo "Created $output_path"
