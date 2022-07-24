import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:locus/src/core/animations.dart';

class Interactable extends StatefulWidget {
  final Widget child;
  final Function onTap;

  const Interactable({
    Key? key,
    required this.child,
    required this.onTap,
  }) : super(key: key);

  @override
  State<Interactable> createState() => _InteractableState();
}

class _InteractableState extends State<Interactable>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

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
      child: AnimatedBuilder(
        animation: _controller,
        builder: (BuildContext context, Widget? child) {
          return Opacity(
            child: Transform.scale(
                scale: .9 + _controller.value * .1, child: child),
            opacity: .5 + _controller.value * .5,
          );
        },
        child: widget.child,
      ),
    );
  }
}
