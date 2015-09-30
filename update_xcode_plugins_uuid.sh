#!/bin/bash

PLISTBUDDY="/usr/libexec/PlistBuddy"

#Get current Xcode DVTPlugInCompatibilityUUID
UUID=$(defaults read /Applications/Xcode.app/Contents/Info DVTPlugInCompatibilityUUID)
echo Xcode DVTPlugInCompatibilityUUID is $UUID

#Traversal all plugins, and update UUID
for MyPlugin in ~/Library/Application\ Support/Developer/Shared/Xcode/Plug-ins/*
do
    $PLISTBUDDY -c "Add :DVTPlugInCompatibilityUUIDs: string $UUID" "$MyPlugin"/Contents/Info.plist
    echo write DVTPlugInCompatibilityUUID to $MyPlugin succeed!
done