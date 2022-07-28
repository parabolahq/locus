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
    var theme = LocusTheme.of(context);

    return ClipRRect(
      clipBehavior: Clip.antiAlias,
      borderRadius: borderRadius ?? BorderRadius.circular(20),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: sigma,
          sigmaY: sigma,
        ),
        child: Container(
          padding: padding,
          color: color ??
              (sigma > 0
                  ? theme.colorScheme.acrylicSurface
                  : theme.colorScheme.controlsSurface),
          constraints: constraints ?? null,
          child: child,
        ),
      ),
    );
  }
}
