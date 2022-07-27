import 'package:locus/locus.dart';
import 'package:locuslab/screens/icons_screen.dart';

class HeroScreen extends StatelessWidget {
  const HeroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LocusScaffold(
      body: Padding(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top + 20,
          left: 15,
          right: 15,
        ),
        child: Column(
          children: [
            Hero(
              tag: 'arcylic_container',
              child: LocusButton(
                constraints: BoxConstraints.expand(height: 200),
                onTap: () => Navigator.of(context).pop(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(LocusIcons.backward, size: 25),
                    SizedBox(height: 10),
                    Text(
                      'Fuck go back',
                      style: LocusTheme.of(context).typography.body1,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            LocusPushButton(
              leading: Icon(LocusIcons.album),
              child: Text('Открыть ещё одну страницу'),
              onTap: () => Navigator.of(context).push(
                LocusPageRoute(
                  builder: (BuildContext context) => IconsScreen(),
                ),
              ),
            )
          ],
        ),
      ),
      bottom: LocusNavigationBar(
        middle: Text('Hero'),
      ),
    );
  }
}
