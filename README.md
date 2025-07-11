# Custom Animation AppBar

A Flutter package that provides a custom animated `SliverAppBar`.

## Features

- Smooth animation between expanded and collapsed states.
- Displays detailed information (image, title, description) when expanded.
- Shows a compact row with image and title when collapsed.

## Installation

1.  In your Flutter project's `pubspec.yaml`, add the following dependency:

```yaml
dependencies:
  flutter:
    sdk: flutter
  custom_animation_appbar:
    git:
      url: https://github.com/IbrahimElbazz/custom_animation_appbar.git
      ref: main # or the branch name
```

Replace `YOUR_USERNAME/YOUR_REPOSITORY.git` with your actual GitHub repository URL.

## Usage

Import the package in your Dart file:

```dart
import 'package:custom_animation_appbar/custom_animation_appbar.dart';
```

Use it within a `CustomScrollView`:

```dart
CustomScrollView(
  slivers: [
    customAnimationAppbar(
      context: context,
      image: 'YOUR_IMAGE_URL',
      title: 'Your Title',
      descripton: 'Your Description',
    ),
    // ... other slivers
  ],
)
```
