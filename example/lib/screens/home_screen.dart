import 'package:locus/locus.dart';
import 'package:locuslab/provider/theme_manager.dart';
import 'package:locuslab/screens/icons_screen.dart';
import 'package:locuslab/screens/hero_screen.dart';
import 'package:locuslab/screens/tabs_screen.dart';
import 'package:locuslab/screens/typography_screen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LocusScaffold(
      bottom: LocusNavigationBar(
        middle: Text('Дом'),
        actions: [
          LocusActionButton(
            child: Icon(LocusIcons.ellipse),
            onTap: () {
              Provider.of<ThemeProvider>(context, listen: false).toggle();
            },
          )
        ],
      ),
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
          LocusPushButton(
            child: Text('Типографика'),
            leading: Icon(LocusIcons.align_left),
            onTap: () => Navigator.of(context).push(
              LocusPageRoute(
                builder: (BuildContext context) => TypographyScreen(),
              ),
            ),
          ),
          SizedBox(height: 10),
          LocusPushButton(
            child: Text('Иконки'),
            leading: Icon(LocusIcons.apps),
            onTap: () => Navigator.of(context).push(
              LocusPageRoute(
                builder: (BuildContext context) => IconsScreen(),
              ),
            ),
          ),
          SizedBox(height: 10),
          LocusPushButton(
            child: Text('Таб-бар'),
            leading: Icon(LocusIcons.tag),
            onTap: () => Navigator.of(context).push(
              LocusPageRoute(
                builder: (BuildContext context) => TabsScreen(),
              ),
            ),
          ),
          SizedBox(height: 10),
          Hero(
            tag: 'arcylic_container',
            child: LocusPushButton(
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
