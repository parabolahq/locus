import 'package:locus/locus.dart';

class IconsScreen extends StatelessWidget {
  const IconsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LocusScaffold(
      top: NavigationBar(
        middle: Text('Иконки'),
      ),
      body: GridView.builder(
        padding: EdgeInsets.only(
          left: 10,
          right: 10,
          top: MediaQuery.of(context).padding.top,
          bottom: MediaQuery.of(context).padding.bottom,
        ),
        gridDelegate:
            SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 65),
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
