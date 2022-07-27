import 'dart:ui';

import 'package:locus/locus.dart';
import 'package:locuslab/provider/theme_manager.dart';
import 'package:locuslab/screens/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      child: LocusLabApp(),
      create: (BuildContext context) => ThemeProvider(),
    ),
  );
}

class LocusLabApp extends StatefulWidget {
  @override
  State<LocusLabApp> createState() => _LocusLabAppState();
}

class _LocusLabAppState extends State<LocusLabApp> {
  @override
  Widget build(BuildContext context) {
    var brightness = Provider.of<ThemeProvider>(context).brightness;

    return LocusApp(
      title: 'Lab',
      home: HomeScreen(),
      theme: LocusThemeData(brightness: brightness),
    );
  }
}
