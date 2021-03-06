#!/bin/bash

RESOURCE_DIR="$PWD/example/ios/build/Build/Products/Release-macosx/NetInfoExample-macOS.app"
ENTRY_FILE="example/index.tsx"
BUNDLE_FILE="$RESOURCE_DIR/main.jsbundle"
EXTRA_PACKAGER_ARGS="--entry-file=$ENTRY_FILE --use-react-native-macos"
BUILD_ACTIONS="$@"

echo "[XCode e2e] Building macOS project"
export RCT_NO_LAUNCH_PACKAGER=true
xcodebuild \
  -project example/macos/NetInfoExample.xcodeproj \
  -scheme NetInfoExample-macOS \
  -configuration Release \
  -sdk macosx \
  -derivedDataPath example/macos/build \
  -UseModernBuildSystem=NO \
  BUNDLE_FILE="$BUNDLE_FILE" \
  EXTRA_PACKAGER_ARGS="$EXTRA_PACKAGER_ARGS" \
  $BUILD_ACTIONS

exit $?
