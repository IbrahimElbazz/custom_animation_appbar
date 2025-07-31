# Custom Animation AppBar

[![pub version](https://img.shields.io/pub/v/custom_animation_appbar.svg)](https://pub.dev/packages/custom_animation_appbar)
[![license](https://img.shields.io/badge/license-MIT-blue.svg)](https://opensource.org/licenses/MIT)

A highly customizable Flutter `SliverAppBar` that smoothly animates its content and size between an expanded and a collapsed state. Perfect for creating beautiful and engaging user profiles, event pages, and more.

---

### ملخص باللغة العربية

هذه الحزمة توفر `SliverAppBar` قابل للتخصيص بالكامل مع حركة (animation) تلقائية بين حالتين (ممتدة ومصغرة). تم تحديث الحزمة لتكون أبسط وأكثر قوة.

**أهم الميزات الجديدة:**
- **واجهة برمجية مبسطة:** استخدم `CustomAnimationAppBar.create()` للتحكم الكامل.
- **تخصيص كامل للواجهة:** يمكنك الآن تمرير الويدجت الخاصة بك للحالة الممتدة (`expandedWidget`) والمصغرة (`collapsedWidget`).
- **دعم الإصدارات القديمة:** الدالة القديمة `customAnimationAppbar()` لا تزال متاحة.

---

## ✨ Key Features

*   **Simplified API**: A new `CustomAnimationAppBar.create()` builder for maximum control.
*   **Full UI Control**: Pass your own custom widgets for both `expandedWidget` and `collapsedWidget` states.
*   **Legacy Support**: The original `customAnimationAppbar()` function is still available for backward compatibility.
*   **Smooth Animations**: Built-in animations for a seamless user experience.

## ⚙️ Installation

Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
  custom_animation_appbar: ^2.0.0 # Use the latest version
```

Then, install it by running `flutter pub get` in your terminal.

## 🚀 How to Use

Import the package in your Dart file:

```dart
import 'package:custom_animation_appbar/custom_animation_appbar.dart';
```

### Modern API: `CustomAnimationAppBar.create()` (Recommended)

This is the recommended approach for full control over the AppBar's content and appearance.

```dart
Scaffold(
  body: CustomScrollView(
    slivers: [
      CustomAnimationAppBar.create(
        context: context,
        // Provide your own widgets for each state
        expandedWidget: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(radius: 35, child: Icon(Icons.dashboard_customize)),
            SizedBox(height: 12),
            Text('Fully Custom AppBar', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          ],
        ),
        collapsedWidget: const Row(
          children: [
            CircleAvatar(radius: 18, child: Icon(Icons.dashboard_customize)),
            SizedBox(width: 12),
            Text('Custom AppBar', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
          ],
        ),
        // General AppBar properties
        expandedHeight: 320,
        backgroundColor: Colors.green.shade50,
        animationDuration: const Duration(milliseconds: 500),
      ),
      // Your scrollable content
      SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) => ListTile(title: Text('Item ${index + 1}')),
          childCount: 20,
        ),
      ),
    ],
  ),
);
```

### Legacy API: `customAnimationAppbar()`

For quick implementation or backward compatibility, you can use the legacy function. This is less flexible but simpler for basic use cases.

```dart
Scaffold(
  body: CustomScrollView(
    slivers: [
      customAnimationAppbar(
        context: context,
        image: 'https://images.unsplash.com/photo-1511485977113-f34c92461ad9?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1170&q=80',
        title: 'Ahmed Mohamed',
        descripton: 'Flutter Developer',
      ),
      // Your scrollable content
      SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) => ListTile(title: Text('Item ${index + 1}')),
          childCount: 20,
        ),
      ),
    ],
  ),
);
```

## 🔧 Parameters

| Parameter         | Type                | Description                                                                 |
| ----------------- | ------------------- | --------------------------------------------------------------------------- |
| `context`         | `BuildContext`      | **Required.** The build context.                                            |
| `expandedWidget`  | `Widget?`           | The widget to display in the expanded state.                                |
| `collapsedWidget` | `Widget?`           | The widget to display in the collapsed state.                               |
| `expandedHeight`  | `double?`           | The maximum height of the expanded app bar.                                 |
| `backgroundColor` | `Color`             | The background color of the app bar.                                        |
| `animationDuration` | `Duration`          | The duration of the animation between states. Default is `300ms`.           |
| `pinned`          | `bool`              | Whether the app bar should remain visible at the top. Default is `true`.    |
| `...`             | `...`               | Other standard `SliverAppBar` properties are also available.                |


## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is licensed under the MIT License.
