import 'dart:ui';

import 'package:flutter/widgets.dart';
import 'package:locus/src/core/theme.dart';

class LocusCard extends StatelessWidget {
  final Widget child;
  final double sigma;

  final Color? color;
  final EdgeInsets? padding;
  final BorderRadius? borderRadius;
  final BoxConstraints? constraints;

  const LocusCard({
    super.key,
    required this.child,
    this.borderRadius,
    this.constraints,
    this.color,
    this.padding,
  }) : sigma = 0;

  const LocusCard.acrylic({
    super.key,
    required this.child,
    this.borderRadius,
    this.constraints,
    this.color,
    this.padding,
    this.sigma = 10,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      padding: padding,
      decoration: BoxDecoration(
        borderRadius: borderRadius ?? BorderRadius.circular(20),
        color: color ?? LocusTheme.of(context).colorScheme.controlsSurface,
      ),
      constraints: constraints,
      child: sigma > 0
          ? BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: sigma,
                sigmaY: sigma,
              ),
              child: child,
            )
          : child,
    );
  }
}
