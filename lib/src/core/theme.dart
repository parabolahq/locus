import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:locus/src/core/colors.dart';

import 'package:locus/src/core/typography.dart';

class LocusTheme extends StatelessWidget {
  final LocusThemeData data;
  final Widget child;

  const LocusTheme({
    super.key,
    required this.data,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return _InheritedLocusTheme(
      data: data,
      child: DefaultTextStyle(
        style: data.typography.body2,
        child: child,
      ),
    );
  }

  static LocusThemeData of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<_InheritedLocusTheme>()!
        .data;
  }
}

class _InheritedLocusTheme extends InheritedTheme {
  const _InheritedLocusTheme({
    required this.data,
    required super.child,
  });

  final LocusThemeData data;

  @override
  bool updateShouldNotify(covariant _InheritedLocusTheme oldWidget) =>
      oldWidget.data != data;

  @override
  Widget wrap(BuildContext context, Widget child) {
    return _InheritedLocusTheme(child: child, data: data);
  }
}

class LocusThemeData with Diagnosticable {
  final Color backgroundColor;
  final Color? _foregroundColor;
  final Brightness? _brightness;
  final LocusTypography? _typography;

  const LocusThemeData({
    this.backgroundColor = LocusColors.white,
    Color? foregroundColor,
    Brightness? brightness,
    LocusTypography? typography,
  })  : _brightness = brightness,
        _foregroundColor = foregroundColor,
        _typography = typography;

  Brightness get brightness {
    return _brightness ??
        (backgroundColor.computeLuminance() > .5
            ? Brightness.light
            : Brightness.dark);
  }

  Color get foregroundColor {
    return _foregroundColor ??
        (brightness == Brightness.dark ? LocusColors.white : LocusColors.black);
  }

  LocusTypography get typography =>
      _typography ?? LocusTypography.fromTheme(this);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(ColorProperty('backgroundColor', backgroundColor));
    properties.add(ColorProperty('foregroundColor', _foregroundColor));
    properties.add(EnumProperty<Brightness?>('brightness', _brightness));
    properties
        .add(DiagnosticsProperty<LocusTypography?>('typography', _typography));
  }
}
