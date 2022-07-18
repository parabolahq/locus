import 'package:locus/locus.dart';

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
      home: LocusScaffold(
        navigationBar: NavigationBar(),
        body: ListView.builder(
          itemBuilder: (context, index) => Text('s'),
        ),
      ),
      title: 'Lab',
    );
  }
}
