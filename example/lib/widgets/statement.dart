import 'package:locus/locus.dart';

class Statement extends StatelessWidget {
  final String title, content;

  const Statement({
    super.key,
    required this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(title, style: LocusTheme.of(context).typography.title),
        SizedBox(height: 10),
        Text(content, style: LocusTheme.of(context).typography.giant),
      ],
    );
  }
}
