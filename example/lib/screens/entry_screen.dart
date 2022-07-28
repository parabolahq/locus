import 'package:locus/locus.dart';

class EntryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LocusScaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LocusEntry(),
        ],
      ),
      bottom: LocusNavigationBar(
        middle: Text('Поля для ввода'),
      ),
    );
  }
}
