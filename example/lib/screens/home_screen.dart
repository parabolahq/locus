import 'dart:ui';

import 'package:locus/locus.dart';
import 'package:locuslab/screens/icons_screen.dart';
import 'package:locuslab/screens/hero_screen.dart';
import 'package:locuslab/screens/typography_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LocusScaffold(
      body: ListView(
        padding: EdgeInsets.only(
          left: 15,
          right: 15,
          top: MediaQuery.of(context).padding.top + 40,
          bottom: MediaQuery.of(context).padding.bottom + 40,
        ),
        children: [
          Text(
            'Locus Lab',
            style: LocusTheme.of(context).typography.giant,
          ),
          SizedBox(height: 20),
          PushButton(
            child: Text('Типографика'),
            leading: Icon(LocusIcons.align_left),
            onTap: () => Navigator.of(context).push(
              LocusPageRoute(
                builder: (BuildContext context) => TypographyScreen(),
              ),
            ),
          ),
          SizedBox(height: 10),
          PushButton(
            child: Text('Иконки'),
            leading: Icon(LocusIcons.apps),
            onTap: () => Navigator.of(context).push(
              LocusPageRoute(
                builder: (BuildContext context) => IconsScreen(),
              ),
            ),
          ),
          SizedBox(height: 10),
          Hero(
            tag: 'arcylic_container',
            child: PushButton(
              child: Text('Hero-анимэйшен'),
              leading: Icon(LocusIcons.star),
              onTap: () => Navigator.of(context).push(
                LocusPageRoute(
                  builder: (BuildContext context) => HeroScreen(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
