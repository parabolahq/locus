import 'package:locus/locus.dart';

void main() {
  runApp(LocusLabApp());
}

class LocusLabApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LocusApp(
      home: Text('Hello, world'),
      title: 'Lab',
    );
  }
}
