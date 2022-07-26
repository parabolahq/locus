import 'package:locus/locus.dart';

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
              child: Acrylic(
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Placeholder(
                    fallbackHeight: 200,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      navigationBar: NavigationBar(
        middle: Text('Hero'),
      ),
    );
  }
}
