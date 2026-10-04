#!/usr/bin/env bash
set -euo pipefail
time -p cd "$(dirname "$0")"
if [[ -z "${CAPTURE_URL:-}" ]]; then /usr/bin/time -p bash -c 'echo "CAPTURE_URL is required" >&2'; exit 1; fi
if [[ -z "${CAPTURE_DIR:-}" ]]; then /usr/bin/time -p bash -c 'echo "CAPTURE_DIR is required" >&2'; exit 1; fi
if [[ -z "${RUNTIME_DIR:-}" ]]; then /usr/bin/time -p bash -c 'echo "RUNTIME_DIR is required" >&2'; exit 1; fi
/usr/bin/time -p mkdir -p "$CAPTURE_DIR"
/usr/bin/time -p node "${RUNTIME_DIR}/scripts/default-capture.mjs"
/usr/bin/time -p test -f "$CAPTURE_DIR/final-desktop.png"
/usr/bin/time -p test -f "$CAPTURE_DIR/final-mobile.png"
/usr/bin/time -p ls -lh "$CAPTURE_DIR/final-desktop.png" "$CAPTURE_DIR/final-mobile.png"
