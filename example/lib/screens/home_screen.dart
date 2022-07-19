import 'package:locus/locus.dart';
import 'package:locuslab/screens/typography_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LocusScaffold(
      navigationBar: NavigationBar(
        middle: Text('Home'),
      ),
      body: ListView(
        padding: EdgeInsets.only(
          left: 15,
          right: 15,
          top: MediaQuery.of(context).padding.top + 40,
        ),
        children: [
          // Statement(
          //   title: 'Зачем нужен Locus?',
          //   content: 'Греки определили параболу, '
          //       'используя понятие «локуса»',
          // ),
          // SizedBox(height: 30),
          // Statement(
          //   title: 'Что такое Locus?',
          //   content: '«Локус» — это множество точек, '
          //       'удовлетворяющих заданному условию',
          // ),
          // SizedBox(height: 60),
          Text(
            'Samples',
            style: LocusTheme.of(context).typography.giant,
          ),
          SizedBox(height: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Interactable(
                child: Text('Typography ->'),
                onTap: () => Navigator.of(context).push(
                  LocusPageRoute(
                    builder: (BuildContext context) => TypographyScreen(),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
