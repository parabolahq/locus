import 'package:flutter/foundation.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:locus/src/core/theme.dart';

class LocusColors {
  static const Color white = Color.fromRGBO(255, 255, 255, 1);
  static const Color black = Color.fromRGBO(0, 0, 0, 1);
  static const Color grey = Color.fromRGBO(127, 127, 127, 1);
}

class LocusColorScheme with Diagnosticable {
  final Color onSurface, surface, controlsSurface, onControlsSurface;

  const LocusColorScheme.raw({
    required this.onSurface,
    required this.surface,
    required this.controlsSurface,
    required this.onControlsSurface,
  });

  double get luminance => surface.computeLuminance();

  factory LocusColorScheme.fromTheme(LocusThemeData data) {
    final bright = data.brightness == Brightness.light;

    return LocusColorScheme.raw(
      onSurface: bright ? LocusColors.black : LocusColors.white,
      surface: bright ? LocusColors.white : LocusColors.black,
      controlsSurface: bright
          ? LocusColors.grey.withOpacity(.2)
          : LocusColors.white.withOpacity(.2),
      onControlsSurface: bright ? LocusColors.black : LocusColors.white,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(ColorProperty('controlsBackground', controlsSurface));
    properties.add(ColorProperty('surface', surface));
    properties.add(ColorProperty('onSurface', onSurface));
    properties.add(ColorProperty('onControlsSurface', onControlsSurface));
  }

  static LocusColorScheme lerp(
      LocusColorScheme a, LocusColorScheme b, double t) {
    return LocusColorScheme.raw(
      onSurface: Color.lerp(a.onSurface, b.onSurface, t)!,
      surface: Color.lerp(a.surface, b.surface, t)!,
      controlsSurface: Color.lerp(a.controlsSurface, b.controlsSurface, t)!,
      onControlsSurface:
          Color.lerp(a.onControlsSurface, b.onControlsSurface, t)!,
    );
  }
}
