#!/bin/bash

npm i

react-native link

react-native bundle --dev false --platform android --entry-file index.js --bundle-output ./android/app/build/intermediates/assets/debug/index.android.bundle --assets-dest ./android/app/build/intermediates/res/merged/debug

cd android

./gradlew assembleDebug

./gradlew assembleRelease

echo "Apks built."

echo "Checking apks exist or not"

if [ ! -f app/build/outputs/apk/debug/app-debug.apk ]; then
    echo "Debug apk not found!"
fi

if [ ! -f app/build/outputs/apk/release/app-release-unsigned.apk ]; then
    echo "Release apk not found!"
fi
