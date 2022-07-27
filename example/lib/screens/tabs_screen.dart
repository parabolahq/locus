import 'package:locus/locus.dart';

class TabsScreen extends StatelessWidget {
  const TabsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LocusScaffold(
      top: LocusTabBar(),
      bottom: LocusActionButton.large(
        child: Icon(LocusIcons.clear),
        onTap: () => Navigator.of(context).pop(),
      ),
      body: ListView.builder(
        itemCount: 50,
        itemBuilder: (BuildContext context, int index) {
          return Image.network(
            'https://picsum.photos/id/${index * 5 + 100}/1000/1000',
          );
        },
      ),
    );
  }
}
