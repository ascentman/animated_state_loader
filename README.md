[![Pub Version](https://img.shields.io/pub/v/animated_state_loader)](https://pub.dev/packages/animated_state_loader)
![GitHub](https://img.shields.io/github/license/davigmacode/flutter_animated_checkmark)
[![GitHub](https://badgen.net/badge/icon/buymeacoffee?icon=buymeacoffee&color=yellow&label)](https://buymeacoffee.com/ascentman9s)

A Flutter package providing an animated loader widget that overlays a child
widget. The loader supports various animation types such as loading, success,
error, and info. Customize the appearance, duration, and content of the loader
overlay.

## Preview

![](https://github.com/ascentman/animated_state_loader/blob/main/media/demo.gif)

## Features

![](https://github.com/ascentman/animated_state_loader/blob/main/media/loader.gif)
![](https://github.com/ascentman/animated_state_loader/blob/main/media/success.gif)
![](https://github.com/ascentman/animated_state_loader/blob/main/media/error.gif)
![](https://github.com/ascentman/animated_state_loader/blob/main/media/info.gif)

- Animated check, error, loading and info icons
- Customized duration, color, stroke width and bottom content widget if
  necessary
- Customized background opacity, container's color and corner radius

## Usage

Basic example:

```dart
AnimatedStateLoader(
      size: 60,
      animationType: AnimationType.loading,
      child: Scaffold(
        body: Container(),
      ),
    );
```

For more examples with state transition from loading to error and success visit:
[GitHub repository](https://github.com/ascentman/animated_state_loader/tree/main/example)

## Sponsoring

<a href="https://buymeacoffee.com/ascentman9s" target="_blank"><img src="https://cdn.buymeacoffee.com/buttons/v2/default-yellow.png" alt="Buy Me A Coffee" height="45"></a>
