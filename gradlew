#!/usr/bin/env sh
set -e

DIR="$(cd "$(dirname "$0")" && pwd)"
GRADLE_WRAPPER_JAR="$DIR/gradle/wrapper/gradle-wrapper.jar"

if [ ! -f "$GRADLE_WRAPPER_JAR" ]; then
  echo "Downloading Gradle Wrapper..."
  mkdir -p "$DIR/gradle/wrapper"
  curl -L https://services.gradle.org/distributions/gradle-8.2-bin.zip -o gradle.zip
  unzip -q gradle.zip
  cp gradle-8.2/lib/gradle-wrapper-*.jar "$GRADLE_WRAPPER_JAR"
  rm -rf gradle.zip gradle-8.2
fi

exec java -jar "$GRADLE_WRAPPER_JAR" "$@"
