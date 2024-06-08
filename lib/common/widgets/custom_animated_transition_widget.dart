import 'package:flutter/material.dart';
import 'package:real_state/core/extensions/context_extension.dart';

class CustomAnimatedTransitionWidget extends StatefulWidget {
  final int index;
  final Widget child;
  final bool isVertical;

  const CustomAnimatedTransitionWidget(
      {super.key,
      required this.index,
      required this.child,
      this.isVertical = true});

  @override
  State<CustomAnimatedTransitionWidget> createState() =>
      _CustomAnimatedTransitionWidgetState();
}

class _CustomAnimatedTransitionWidgetState
    extends State<CustomAnimatedTransitionWidget> {
  bool startAnimation = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(
        Duration.zero,
        () => setState(() {
              startAnimation = true;
            }));
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
        curve: Curves.easeInOut,
        transform: widget.isVertical
            ? Matrix4.translationValues(
                context.currentLocale == "ar"
                    ? startAnimation
                        ? 0
                        : 100 // Right to Left for Arabic
                    : startAnimation
                        ? 0
                        : -100, // Left to Right for English
                0,
                0,
              )
            : Matrix4.translationValues(
                0, startAnimation ? 0 : context.height, 0),
        duration: const Duration(milliseconds: 300),
        // duration: Duration(milliseconds: 100 + (widget.index * 300)),
        child: widget.child);
  }
}
