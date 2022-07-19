import 'package:flutter/widgets.dart';

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
    _controller = AnimationController(vsync: this, value: 1);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _animateTapDown() async {
    await _controller.animateTo(0, duration: const Duration(milliseconds: 50));
  }

  Future<void> _animateTapUp() async {
    await _controller.animateTo(1, duration: const Duration(milliseconds: 50));
  }

  @override
  Widget build(BuildContext context) {
    // TODO: Absorb taps while pressed

    return GestureDetector(
      onTapDown: (TapDownDetails details) => _animateTapDown(),
      onTapUp: (TapUpDetails details) async {
        await widget.onTap();
        _animateTapUp();
      },
      onTapCancel: _animateTapUp,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (BuildContext context, Widget? child) {
          return Opacity(
            child: Transform.scale(scale: .8 + _controller.value * .2, child: child),
            opacity: .7 + _controller.value * .3,
          );
        },
        child: widget.child,
      ),
    );
  }
}