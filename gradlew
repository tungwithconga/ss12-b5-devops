#!/bin/sh
set -eu
cd "$(dirname "$0")"
JAR="gradle/wrapper/gradle-wrapper.jar"
if [ ! -s "$JAR" ]; then
  echo "Downloading official Gradle wrapper bootstrap..."
  curl --fail --location --retry 3 --output "$JAR" "https://raw.githubusercontent.com/gradle/gradle/v8.14.3/gradle/wrapper/gradle-wrapper.jar" || { rm -f "$JAR"; echo "Download failed. Check your internet connection." >&2; exit 1; }
fi
exec java -cp "$JAR" org.gradle.wrapper.GradleWrapperMain "$@"
