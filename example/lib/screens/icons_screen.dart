import 'package:locus/locus.dart';

class IconsScreen extends StatelessWidget {
  const IconsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LocusScaffold(
      top: LocusNavigationBar(
        middle: Text('Иконки'),
      ),
      body: GridView.builder(
        gridDelegate:
            SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 60),
        itemBuilder: (BuildContext context, int index) {
          return Icon(
            LocusIcons.all.values.elementAt(index),
            size: 25,
          );
        },
        itemCount: LocusIcons.all.length,
      ),
    );
  }
}
