[![Pub Version](https://img.shields.io/pub/v/animated_state_loader)](https://pub.dev/packages/animated_state_loader)
![GitHub](https://img.shields.io/github/license/davigmacode/flutter_animated_checkmark)
[![GitHub](https://badgen.net/badge/icon/buymeacoffee?icon=buymeacoffee&color=yellow&label)](http://buymeacoffee.com/ascentman9s)

A Flutter package providing an animated loader widget that overlays a child
widget. The loader supports various animation types such as loading, success,
error, and info. Customize the appearance, duration, and content of the loader
overlay.

## Preview

<a href="https://github.com/ascentman/animated_state_loader/blob/main/media/demo.mov">
  <img src="https://github.com/ascentman/animated_state_loader/blob/main/media/demo.mov" alt="Preview" width="300"/>
</a>

## Features

<a href="https://github.com/ascentman/animated_state_loader/blob/main/media/loader.mov">
  <img src="https://github.com/ascentman/animated_state_loader/blob/main/media/loader.mov" alt="Preview" width="100"/>
</a>

<a href="https://github.com/ascentman/animated_state_loader/blob/main/media/info.mov">
  <img src="https://github.com/ascentman/animated_state_loader/blob/main/media/info.mov" alt="Preview" width="100"/>
</a>

<a href="https://github.com/ascentman/animated_state_loader/blob/main/media/success.mov">
  <img src="https://github.com/ascentman/animated_state_loader/blob/main/media/success.mov" alt="Preview" width="100"/>
</a>

<a href="https://github.com/ascentman/animated_state_loader/blob/main/media/error.mov">
  <img src="https://github.com/ascentman/animated_state_loader/blob/main/media/error.mov" alt="Preview" width="100"/>
</a>


- Animated check, error, loading and info icons
- Customized duration, color, stroke width and bottom content widget if necessary
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

For more examples with state transition from loading to error and success visit: [GitHub repository](https://github.com/ascentman/animated_state_loader/tree/main/example)

## Sponsoring

<a href="http://buymeacoffee.com/ascentman9s" target="_blank"><img src="https://cdn.buymeacoffee.com/buttons/v2/default-yellow.png" alt="Buy Me A Coffee" height="45"></a>
