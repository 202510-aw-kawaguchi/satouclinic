#!/bin/sh
set -eu

BASE_DIR=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
WRAPPER_DIR="$BASE_DIR/.mvn/wrapper"
WRAPPER_PROPERTIES="$WRAPPER_DIR/maven-wrapper.properties"
WRAPPER_JAR="$WRAPPER_DIR/maven-wrapper.jar"

if [ ! -f "$WRAPPER_PROPERTIES" ]; then
  echo "Wrapper properties not found: $WRAPPER_PROPERTIES" >&2
  exit 1
fi

if [ ! -f "$WRAPPER_JAR" ]; then
  WRAPPER_URL=$(sed -n 's/^wrapperUrl=//p' "$WRAPPER_PROPERTIES")
  if [ -z "${WRAPPER_URL:-}" ]; then
    echo "wrapperUrl is not set in $WRAPPER_PROPERTIES" >&2
    exit 1
  fi

  mkdir -p "$WRAPPER_DIR"
  if command -v curl >/dev/null 2>&1; then
    curl -fsSL "$WRAPPER_URL" -o "$WRAPPER_JAR"
  elif command -v wget >/dev/null 2>&1; then
    wget -qO "$WRAPPER_JAR" "$WRAPPER_URL"
  else
    echo "curl or wget is required to download the Maven Wrapper jar." >&2
    exit 1
  fi
fi

exec java -classpath "$WRAPPER_JAR" "-Dmaven.multiModuleProjectDirectory=$BASE_DIR" org.apache.maven.wrapper.MavenWrapperMain "$@"
