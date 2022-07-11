import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import 'package:locus/src/core/colors.dart';

const _kDefaultTheme = LocusThemeData(
  foregroundColor: LocusColors.black,
  backgroundColor: LocusColors.white,
  brightness: Brightness.light,
);

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
        style: TextStyle(color: data.foregroundColor),
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
  final Color? _backgroundColor;
  final Color? _foregroundColor;
  final Brightness? _brightness;

  // TODO: Implement typography

  const LocusThemeData({
    Color? backgroundColor,
    Color? foregroundColor,
    Brightness? brightness,
  })  : _brightness = brightness,
        _foregroundColor = foregroundColor,
        _backgroundColor = backgroundColor;

  Brightness get brightness => _brightness ?? _kDefaultTheme.brightness;
  Color get foregroundColor =>
      _foregroundColor ?? _kDefaultTheme.foregroundColor;
  Color get backgroundColor =>
      _backgroundColor ?? _kDefaultTheme.backgroundColor;

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(ColorProperty('backgroundColor', _backgroundColor));
    properties.add(ColorProperty('foregroundColor', _foregroundColor));
    properties.add(EnumProperty<Brightness?>('brightness', _brightness));
  }
}
