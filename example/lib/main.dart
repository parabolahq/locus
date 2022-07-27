import 'dart:ui';

import 'package:locus/locus.dart';
import 'package:locuslab/screens/home_screen.dart';

void main() {
  runApp(LocusLabApp());
}

class LocusLabApp extends StatefulWidget {
  @override
  State<LocusLabApp> createState() => _LocusLabAppState();
}

class _LocusLabAppState extends State<LocusLabApp> {
  @override
  Widget build(BuildContext context) {
    return LocusApp(
      title: 'Lab',
      home: HomeScreen(),
      theme: LocusThemeData(brightness: Brightness.dark),
    );
  }
}
