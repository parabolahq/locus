import 'package:locus/locus.dart';

class TypographyScreen extends StatelessWidget {
  const TypographyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LocusScaffold(
      bottom: NavigationBar(
        middle: Text('Типографика'),
      ),
      body: ListView(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top + 40,
          left: 15,
          right: 15,
        ),
        children: [
          Text(
            'Giant',
            style: LocusTheme.of(context).typography.giant,
          ),
          SizedBox(height: 10),
          Text(
            'Heading',
            style: LocusTheme.of(context).typography.heading,
          ),
          SizedBox(height: 10),
          Text(
            'Title',
            style: LocusTheme.of(context).typography.title,
          ),
          SizedBox(height: 10),
          Text(
            'Body1',
            style: LocusTheme.of(context).typography.body1,
          ),
          SizedBox(height: 10),
          Text(
            'Body2',
            style: LocusTheme.of(context).typography.body2,
          ),
          SizedBox(height: 10),
          Text(
            'Caption1',
            style: LocusTheme.of(context).typography.caption1,
          ),
          SizedBox(height: 10),
          Text(
            'Caption2',
            style: LocusTheme.of(context).typography.caption2,
          ),
        ],
      ),
    );
  }
}
