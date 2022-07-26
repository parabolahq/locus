import 'dart:ui';

import 'package:flutter/widgets.dart';
import 'package:locus/src/core/animations.dart';
import 'package:locus/src/core/theme.dart';

class Acrylic extends StatelessWidget {
  final Widget child;
  final BoxDecoration? boxDecoration;

  const Acrylic({
    super.key,
    required this.child,
    this.boxDecoration,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: kInteractableAnimationDuration,
      clipBehavior: Clip.antiAlias,
      decoration: boxDecoration ??
          BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: LocusTheme.of(context).colorScheme.controlsSurface,
          ),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 10,
          sigmaY: 10,
        ),
        child: child,
      ),
    );
  }
}
