import 'package:flutter/foundation.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:locus/src/core/theme.dart';

class LocusColors {
  static const Color white = Color.fromRGBO(255, 255, 255, 1);
  static const Color black = Color.fromRGBO(0, 0, 0, 1);
  static const Color darkGrey = Color.fromRGBO(60, 60, 60, 1);
  static const Color grey = Color.fromRGBO(127, 127, 127, 1);
  static const Color lightGrey = Color.fromRGBO(230, 230, 230, 1);
}

class LocusColorScheme with Diagnosticable {
  final Color onSurface, surface, controlsSurface, acrylicSurface;

  const LocusColorScheme.raw({
    required this.onSurface,
    required this.surface,
    required this.acrylicSurface,
    required this.controlsSurface,
  });

  double get luminance => surface.computeLuminance();

  factory LocusColorScheme.fromTheme(LocusThemeData data) {
    final bright = data.brightness == Brightness.light;

    return LocusColorScheme.raw(
      onSurface: bright ? LocusColors.black : LocusColors.white,
      surface: bright ? LocusColors.white : LocusColors.black,
      controlsSurface: bright ? LocusColors.lightGrey : LocusColors.darkGrey,
      acrylicSurface: bright
          ? LocusColors.lightGrey.withOpacity(.6)
          : LocusColors.darkGrey.withOpacity(.6),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(ColorProperty('controlsSurface', controlsSurface));
    properties.add(ColorProperty('acrylicSurface', controlsSurface));
    properties.add(ColorProperty('surface', surface));
    properties.add(ColorProperty('onSurface', onSurface));
  }

  static LocusColorScheme lerp(
      LocusColorScheme a, LocusColorScheme b, double t) {
    return LocusColorScheme.raw(
      onSurface: Color.lerp(a.onSurface, b.onSurface, t)!,
      surface: Color.lerp(a.surface, b.surface, t)!,
      controlsSurface: Color.lerp(a.controlsSurface, b.controlsSurface, t)!,
      acrylicSurface: Color.lerp(a.acrylicSurface, b.acrylicSurface, t)!,
    );
  }

  LocusColorScheme copyWith({
    Color? onSurface,
    Color? surface,
    Color? controlsSurface,
    Color? acrylicSurface,
  }) {
    return LocusColorScheme.raw(
      onSurface: onSurface ?? this.onSurface,
      surface: surface ?? this.surface,
      controlsSurface: controlsSurface ?? this.controlsSurface,
      acrylicSurface: acrylicSurface ?? this.acrylicSurface,
    );
  }
}
