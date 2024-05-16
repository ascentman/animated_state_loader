import 'animated_check_painter.dart';
import 'animated_close_painter.dart';
import 'animated_info_painter.dart';
import 'animated_loading_painter.dart';
import 'animation_type.dart';
import 'package:flutter/material.dart';

/// A widget that displays an animated state loader on top of its child widget.
///
/// The [AnimatedStateLoader] shows an animation based on the provided [animationType] and
/// displays a loading, success, error, or info animation accordingly.
///
/// The [isShown] parameter controls the visibility of the loader.
///
/// The animation will repeat if the [animationType] is [AnimationType.loading].
///
/// It provides additional customization options such as background opacity, container color, border radius, and gesture handling.
class AnimatedStateLoader extends StatefulWidget {
  /// The size of the animated loader.
  final double size;

  /// The color of the animation stroke.
  final Color? color;

  /// The stroke width of the animation.
  final double? strokeWidth;

  /// The duration of the animation.
  final Duration? duration;

  /// The widget to display the animation on top of.
  final Widget child;

  /// The content widget to display inside the loader.
  final Widget? content;

  /// The type of animation to display.
  final AnimationType? animationType;

  /// Whether the loader is shown.
  final bool isShown;

  /// The opacity of the background when the loader is shown.
  final double backgroundOpacity;

  /// The color of the container that holds the loader animation and content.
  final Color containerColor;

  /// The border radius of the container.
  final double containerBorderRadius;

  /// Whether to ignore gestures outside the loader when shown.
  final bool ignoreGesturesOutside;

  const AnimatedStateLoader({
    super.key,
    required this.size,
    required this.child,
    this.animationType,
    this.content,
    this.color,
    this.strokeWidth,
    this.duration,
    this.backgroundOpacity = 0.5,
    this.containerColor = Colors.white,
    this.containerBorderRadius = 10,
    this.ignoreGesturesOutside = true,
    this.isShown = false,
  });

  @override
  State<StatefulWidget> createState() => AnimatedStateLoaderState();
}

class AnimatedStateLoaderState extends State<AnimatedStateLoader>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool _isAnimating = false;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: widget.duration ??
          const Duration(
            milliseconds: 2500,
          ),
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOutCirc,
      ),
    );

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        if (widget.animationType != AnimationType.loading) {
          setState(() {
            _isAnimating = false;
          });
          _controller.reset();
        }
      } else if (status == AnimationStatus.dismissed) {
        setState(() {
          _isAnimating = false;
        });
      }
    });
  }

  @override
  void didUpdateWidget(covariant AnimatedStateLoader oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isShown && !_isAnimating) {
      _startAnimation();
    } else if (!widget.isShown && _isAnimating) {
      _controller.stop();
      setState(() {
        _isAnimating = false;
      });
    } else if (widget.animationType != oldWidget.animationType) {
      _controller.reset();
      _startAnimation();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        if (widget.isShown && _isAnimating) ...[
          IgnorePointer(
            ignoring: widget.ignoreGesturesOutside,
            child: Opacity(
              opacity: widget.backgroundOpacity,
              child: widget.child,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: widget.containerColor,
              borderRadius: BorderRadius.all(
                Radius.circular(
                  widget.containerBorderRadius,
                ),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomPaint(
                    foregroundPainter: _painter(
                      widget.animationType ?? AnimationType.success,
                    ),
                    child: SizedBox(
                      width: widget.size,
                      height: widget.size,
                    ),
                  ),
                  Material(
                    child: widget.content ?? const SizedBox.shrink(),
                  ),
                ],
              ),
            ),
          ),
        ] else
          widget.child,
      ],
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _startAnimation() {
    setState(() {
      _isAnimating = true;
      if (widget.animationType == AnimationType.loading) {
        _controller.repeat();
      } else {
        _controller.forward();
      }
    });
  }

  CustomPainter _painter(AnimationType type) {
    final ThemeData theme = Theme.of(context);
    switch (type) {
      case AnimationType.success:
        return AnimatedCheckPainter(
          _animation,
          widget.color ?? theme.primaryColor,
          widget.strokeWidth,
        );
      case AnimationType.error:
        return AnimatedClosePainter(
          _animation,
          widget.color ?? theme.primaryColor,
          widget.strokeWidth,
        );
      case AnimationType.info:
        return AnimatedInfoPainter(
          _animation,
          widget.color ?? theme.primaryColor,
          widget.strokeWidth,
        );
      case AnimationType.loading:
        return AnimatedLoadingPainter(
          _animation,
          widget.color ?? theme.primaryColor,
          widget.strokeWidth,
        );
    }
  }
}
