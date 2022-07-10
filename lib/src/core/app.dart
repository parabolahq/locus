import 'package:flutter/widgets.dart';
import 'route.dart';
import 'scroll.dart';
import 'theme.dart';

class LocusApp extends StatefulWidget {
  final String title;
  final Iterable<Locale> supportedLocales;
  final bool debugShowCheckedModeBanner, showPerformanceOverlay;
  final Widget? home;
  final LocusThemeData? theme;

  const LocusApp({
    super.key,
    required this.title,
    required this.home,
    this.debugShowCheckedModeBanner = false,
    this.showPerformanceOverlay = false,
    this.supportedLocales = const <Locale>[Locale('ru', 'RU')],
    this.theme,
  });

  @override
  State<LocusApp> createState() => _LocusAppState();

  static HeroController createLocusHeroController() => HeroController();
}

class _LocusAppState extends State<LocusApp> {
  late HeroController _heroController;

  @override
  void initState() {
    super.initState();
    _heroController = LocusApp.createLocusHeroController();
  }

  WidgetsApp _buildWidgetApp(BuildContext context) {
    return WidgetsApp(
      key: GlobalObjectKey(this),
      pageRouteBuilder: <T>(RouteSettings settings, WidgetBuilder builder) {
        return LocusPageRoute<T>(settings: settings, builder: builder);
      },
      color: Color.fromRGBO(255, 255, 255, 255),
      home: widget.home,
      title: widget.title,
      supportedLocales: widget.supportedLocales,
      debugShowCheckedModeBanner: widget.debugShowCheckedModeBanner,
      showPerformanceOverlay: widget.showPerformanceOverlay,
    );
  }

  @override
  Widget build(BuildContext context) {
    final LocusThemeData effectiveThemeData =
        widget.theme ?? const LocusThemeData();

    return ScrollConfiguration(
      behavior: LocusScrollBehavior(),
      child: LocusTheme(
        data: effectiveThemeData,
        child: HeroControllerScope(
          controller: _heroController,
          child: Builder(
            builder: _buildWidgetApp,
          ),
        ),
      ),
    );
  }
}
