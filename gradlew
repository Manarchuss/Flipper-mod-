#!/usr/bin/env sh
set -e
DIR="$(cd "$(dirname "$0")" && pwd)"
if [ ! -f "$DIR/gradle/wrapper/gradle-wrapper.jar" ]; then
    echo "Bootstrapping Gradle wrapper..."
    gradle wrapper --gradle-version 8.10.2 || gradle wrapper
fi
if [ -f "$DIR/gradle/wrapper/gradle-wrapper.jar" ]; then
    exec java -jar "$DIR/gradle/wrapper/gradle-wrapper.jar" "$@"
else
    exec gradle "$@"
fi
