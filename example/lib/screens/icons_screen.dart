import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:locus/locus.dart';

class IconsScreen extends StatelessWidget {
  const IconsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LocusScaffold(
      navigationBar: NavigationBar(middle: Text('Иконки')),
      body: GridView.builder(
        padding: EdgeInsets.only(
          left: 5,
          right: 5,
          top: MediaQuery.of(context).padding.top,
          bottom: MediaQuery.of(context).padding.bottom,
        ),
        gridDelegate:
            SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 50),
        itemBuilder: (BuildContext context, int index) {
          return Icon(
            LocusIcons.all.values.elementAt(index),
          );
        },
        itemCount: LocusIcons.all.length,
      ),
    );
  }
}
