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
  final Brightness brightness;
  final LocusTypography? _typography;
  final LocusColorScheme? _colorScheme;

  const LocusThemeData({
    this.brightness = Brightness.light,
    LocusTypography? typography,
    LocusColorScheme? colorScheme,
  })  : _typography = typography,
        _colorScheme = colorScheme;

  LocusTypography get typography =>
      _typography ?? LocusTypography.fromTheme(this);

  LocusColorScheme get colorScheme =>
      _colorScheme ?? LocusColorScheme.fromTheme(this);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(EnumProperty<Brightness?>('brightness', brightness));
    properties
        .add(DiagnosticsProperty<LocusTypography?>('typography', _typography));
  }
}
