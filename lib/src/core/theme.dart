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
      child: IconTheme(
        data: data.iconTheme,
        child: DefaultTextStyle(
          style: data.typography.body2,
          child: child,
        ),
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
  final LocusIconTheme? _iconTheme;

  const LocusThemeData({
    this.brightness = Brightness.light,
    LocusTypography? typography,
    LocusColorScheme? colorScheme,
    LocusIconTheme? iconTheme,
  })  : _typography = typography,
        _colorScheme = colorScheme,
        _iconTheme = iconTheme;

  LocusTypography get typography =>
      _typography ?? LocusTypography.fromTheme(this);

  LocusColorScheme get colorScheme =>
      _colorScheme ?? LocusColorScheme.fromTheme(this);

  SystemUiOverlayStyle get systemUiOverlayStyle =>
      brightness == Brightness.light
          ? SystemUiOverlayStyle.dark
          : SystemUiOverlayStyle.light;

  IconThemeData get iconTheme => _iconTheme ?? LocusIconTheme.fromTheme(this);

  LocusThemeData copyWith({
    Brightness? brightness,
    LocusTypography? typography,
    LocusColorScheme? colorScheme,
  }) {
    return LocusThemeData(
      brightness: brightness ?? this.brightness,
      typography: typography ?? this.typography,
      colorScheme: colorScheme ?? this.colorScheme,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(EnumProperty<Brightness?>('brightness', brightness));
    properties
        .add(DiagnosticsProperty<LocusTypography?>('typography', _typography));
  }
}

class LocusIconTheme extends IconThemeData {
  LocusIconTheme({
    required super.color,
    super.size = 20,
    super.opacity = 1,
  }) : super(shadows: []);

  factory LocusIconTheme.fromTheme(LocusThemeData data) {
    return LocusIconTheme(color: data.colorScheme.onSurface);
  }
}
