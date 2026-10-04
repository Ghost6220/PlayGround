#!/usr/bin/env bash
set -euo pipefail
time -p cd "$(dirname "$0")"
PORT="${PORT:-3000}"
PROJECT_ROOT="$(/usr/bin/time -p pwd)"
DIST_DIR="${PROJECT_ROOT}/dist"
SRC_DIR="${PROJECT_ROOT}/TheBigBrother/the_big_brother/gui/static"
WEB_DIR="${OPENCODE_WEB_DIR:-/home/runner/work/_temp/omgithub-web}"
/usr/bin/time -p mkdir -p "$DIST_DIR"
/usr/bin/time -p mkdir -p "$WEB_DIR"
/usr/bin/time -p python3 --version
/usr/bin/time -p test -d "$SRC_DIR"
/usr/bin/time -p test -f "$SRC_DIR/index.html"
/usr/bin/time -p cp -f "$SRC_DIR/index.html" "$DIST_DIR/index.html"
/usr/bin/time -p cp -f "$SRC_DIR/3.css" "$DIST_DIR/3.css"
/usr/bin/time -p mkdir -p "$DIST_DIR/js"
/usr/bin/time -p cp -f "$SRC_DIR/js/api.js" "$SRC_DIR/js/app.js" "$SRC_DIR/js/audio-fx.js" "$SRC_DIR/js/cmd-palette.js" "$SRC_DIR/js/companion-tools.js" "$SRC_DIR/js/modules.js" "$SRC_DIR/js/nexus-graph.js" "$SRC_DIR/js/three-backdrop.js" "$DIST_DIR/js/"
/usr/bin/time -p test -f "$DIST_DIR/index.html"
/usr/bin/time -p bash -c "printf '%s' \"{\\\"project\\\":\\\"$PROJECT_ROOT\\\",\\\"directory\\\":\\\"$DIST_DIR\\\"}\" > \"$WEB_DIR/deployment-output.json\""
/usr/bin/time -p cat "$WEB_DIR/deployment-output.json"
/usr/bin/time -p ls -lh "$DIST_DIR/index.html" "$DIST_DIR/3.css" "$DIST_DIR/js"
exec /usr/bin/time -p python3 -m http.server "$PORT" --directory "$DIST_DIR" --bind 0.0.0.0
