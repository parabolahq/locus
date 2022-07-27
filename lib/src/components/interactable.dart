import 'dart:math';

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:locus/src/core/animations.dart';

class Interactable extends StatefulWidget {
  final Widget child;
  final Function onTap;

  const Interactable({
    super.key,
    required this.child,
    required this.onTap,
  });

  @override
  State<Interactable> createState() => _InteractableState();
}

class _InteractableState extends State<Interactable>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      value: 1,
      duration: kInteractableAnimationDuration,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _animateTapDown() async {
    HapticFeedback.lightImpact();
    await _controller.reverse();
  }

  Future<void> _animateTapUp() async {
    await _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await _animateTapDown();
        await _animateTapUp();
        widget.onTap();
      },
      onTapDown: (TapDownDetails details) => _animateTapDown(),
      onTapUp: (TapUpDetails details) => _animateTapUp(),
      onTapCancel: _animateTapUp,
      child: InteractableDrawer(
        controller: _controller,
        child: widget.child,
      ),
    );
  }
}

class InteractableDrawer extends AnimatedWidget {
  final Widget child;

  InteractableDrawer({
    super.key,
    required this.child,
    required AnimationController controller,
  }) : super(listenable: controller);

  Animation<double> get _feedback => listenable as Animation<double>;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      child: Transform.scale(scale: .9 + _feedback.value * .1, child: child),
      opacity: .5 + min(_feedback.value, 1) * .5,
    );
  }
}
