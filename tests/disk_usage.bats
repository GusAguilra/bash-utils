#!/usr/bin/env bats

setup() {
  TMPDIR="$(mktemp -d)"
  PATH="$TMPDIR:$PATH"
}

teardown() {
  rm -rf "$TMPDIR"
}

@test "disk usage below threshold reports OK" {
  cat <<'EODF' > "$TMPDIR/df"
#!/bin/bash
echo "Filesystem 1K-blocks Used Available Use% Mounted on"
echo "mock 100 50 50 50% /"
EODF
  chmod +x "$TMPDIR/df"

  run "$BATS_TEST_DIRNAME/../scripts/disk_usage.sh"
  [ "$status" -eq 0 ]
  [[ "$output" == *"Disk usage is OK"* ]]
}

@test "disk usage above threshold warns" {
  cat <<'EODF' > "$TMPDIR/df"
#!/bin/bash
echo "Filesystem 1K-blocks Used Available Use% Mounted on"
echo "mock 100 90 10 90% /"
EODF
  chmod +x "$TMPDIR/df"

  run "$BATS_TEST_DIRNAME/../scripts/disk_usage.sh"
  [ "$status" -eq 0 ]
  [[ "$output" == *"Disk usage above threshold"* ]]
}
