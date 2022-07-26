import 'package:flutter/services.dart';
import 'package:locus/locus.dart';

class IconsScreen extends StatefulWidget {
  const IconsScreen({super.key});

  @override
  State<IconsScreen> createState() => _IconsScreenState();
}

class _IconsScreenState extends State<IconsScreen> {
  Brightness _brightness = Brightness.light;

  @override
  Widget build(BuildContext context) {
    return LocusTheme(
      data: LocusThemeData(brightness: _brightness),
      child: LocusScaffold(
        top: NavigationBar(
          middle: Text('Иконки'),
          actions: [
            LocusActionButton(
                child: Icon(LocusIcons.ellipse),
                onTap: () => setState(() => _brightness =
                    _brightness == Brightness.light
                        ? Brightness.dark
                        : Brightness.light))
          ],
        ),
        body: GridView.builder(
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
      ),
    );
  }
}
