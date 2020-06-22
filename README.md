# Flutter Todo

## Introduction

Shows how to use some of the best practices when implementing Flutter application. Like:

- Project directory structure
- [ChangeNotifier](https://api.flutter.dev/flutter/foundation/ChangeNotifier-class.html) for simple state management
- [Provider](https://pub.dev/packages/provider) package to manage dependencies

## Installing

After setting up Flutter for [your operating system](https://flutter.dev/docs/get-started/install). In a terminal run:

```
git clone git@github.com:jjmutumi/todo.git
cd todo
flutter pub get
```

## Running

To run in development, in terminal run:

```
flutter run
```

## Release version

You can get a release version to run on a device with:

```
flutter build apk --release --shrink --target-platform android-arm,android-arm64,android-x64 --split-per-abi
```