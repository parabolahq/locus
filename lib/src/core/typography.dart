import 'package:flutter/foundation.dart';
import 'package:flutter/painting.dart';
import 'package:locus/src/core/theme.dart';

class LocusTypography with Diagnosticable {
  final Color color;
  final String fontFamily;

  final TextStyle title;
  final TextStyle heading;
  final TextStyle giant;
  final TextStyle caption2;
  final TextStyle caption1;
  final TextStyle body2;
  final TextStyle body1;

  const LocusTypography.raw({
    required this.color,
    required this.title,
    required this.heading,
    required this.giant,
    required this.caption2,
    required this.caption1,
    required this.body2,
    required this.body1,
    required this.fontFamily,
  });

  factory LocusTypography.fromTheme(LocusThemeData data, {String? fontFamily}) {
    fontFamily ??= 'Manrope';

    return LocusTypography.raw(
      fontFamily: fontFamily,
      color: data.foregroundColor,
      // Body/Regular set as [DefaultTextStyle] in [LocusTheme]
      body2: TextStyle(
        color: data.foregroundColor,
        fontFamily: fontFamily,
        package: 'locus',
        fontWeight: FontWeight.w500,
        fontSize: 17,
        height: 1.2,
        letterSpacing: .5,
      ),
      body1: TextStyle(
        color: data.foregroundColor,
        fontWeight: FontWeight.w600,
        fontSize: 17,
        letterSpacing: .5,
      ),
      title: TextStyle(
        color: data.foregroundColor,
        fontWeight: FontWeight.w700,
        fontSize: 18,
      ),
      heading: TextStyle(
        color: data.foregroundColor,
        fontWeight: FontWeight.w700,
        fontSize: 26,
        letterSpacing: 0,
      ),
      giant: TextStyle(
        color: data.foregroundColor,
        fontWeight: FontWeight.w700,
        fontSize: 34,
        letterSpacing: 0,
      ),
      caption2: TextStyle(
        color: data.foregroundColor,
        fontWeight: FontWeight.w600,
        fontSize: 14,
      ),
      caption1: TextStyle(
        color: data.foregroundColor,
        fontWeight: FontWeight.w700,
        fontSize: 14,
      ),
    );
  }

  static LocusTypography lerp(LocusTypography a, LocusTypography b, double t) {
    return LocusTypography.raw(
      color: Color.lerp(a.color, b.color, t)!,
      title: TextStyle.lerp(a.title, b.title, t)!,
      heading: TextStyle.lerp(a.heading, a.heading, t)!,
      giant: TextStyle.lerp(a.giant, a.giant, t)!,
      caption2: TextStyle.lerp(a.caption2, a.caption2, t)!,
      caption1: TextStyle.lerp(a.caption1, a.caption1, t)!,
      body2: TextStyle.lerp(a.body2, a.body2, t)!,
      body1: TextStyle.lerp(a.body1, a.body1, t)!,
      fontFamily: b.fontFamily,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(ColorProperty('color', color));
    properties.add(DiagnosticsProperty<TextStyle>('title', title));
    properties.add(DiagnosticsProperty<TextStyle>('heading', heading));
    properties.add(DiagnosticsProperty<TextStyle>('giant', giant));
    properties.add(DiagnosticsProperty<TextStyle>('caption2', caption2));
    properties.add(DiagnosticsProperty<TextStyle>('caption1', caption1));
    properties.add(DiagnosticsProperty<TextStyle>('body2', body2));
    properties.add(DiagnosticsProperty<TextStyle>('body1', body1));
    properties.add(StringProperty('fontFamily', fontFamily));
  }
}
