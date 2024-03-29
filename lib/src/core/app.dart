import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:locus/src/core/route.dart';
import 'package:locus/src/core/scroll.dart';
import 'package:locus/src/core/theme.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class LocusApp extends StatefulWidget {
  final String title;
  final Iterable<Locale> supportedLocales;
  final bool debugShowCheckedModeBanner, showPerformanceOverlay;
  final Widget? home;
  final LocusThemeData theme;

  const LocusApp({
    super.key,
    required this.title,
    required this.home,
    this.debugShowCheckedModeBanner = true,
    this.showPerformanceOverlay = false,
    this.supportedLocales = const <Locale>[Locale('ru', 'RU')],
    this.theme = const LocusThemeData(),
  });

  @override
  State<LocusApp> createState() => _LocusAppState();

  static HeroController createLocusHeroController() => HeroController();
}

class _LocusAppState extends State<LocusApp> {
  late final HeroController _heroController;

  @override
  void initState() {
    super.initState();
    _heroController = LocusApp.createLocusHeroController();
  }

  WidgetsApp _buildWidgetApp(BuildContext context) {
    return WidgetsApp(
      key: GlobalObjectKey(this),
      home: widget.home,
      title: widget.title,
      color: widget.theme.colorScheme.surface,
      supportedLocales: widget.supportedLocales,
      debugShowCheckedModeBanner: widget.debugShowCheckedModeBanner,
      showPerformanceOverlay: widget.showPerformanceOverlay,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      pageRouteBuilder: <T>(RouteSettings settings, WidgetBuilder builder) {
        return LocusPageRoute<T>(settings: settings, builder: builder);
      },
      builder: (BuildContext context, Widget? child) {
        final LocusThemeData effectiveThemeData =
            MediaQuery.of(context).platformBrightness == Brightness.light
                ? widget.theme
                : widget.theme;
        // TODO: Implement dark theme based
        // on platform brightness

        return LocusTheme(
          data: effectiveThemeData,
          child: child ?? SizedBox.shrink(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: LocusScrollBehavior(),
      child: HeroControllerScope(
        controller: _heroController,
        child: Builder(
          builder: _buildWidgetApp,
        ),
      ),
    );
  }
}
