import 'package:flutter/widgets.dart';
import 'package:locus/src/core/theme.dart';

class LocusScaffold extends StatelessWidget {
  final Widget body;

  const LocusScaffold({
    super.key,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    var theme = LocusTheme.of(context);

    return Container(
      decoration: BoxDecoration(
        color: theme.backgroundColor,
      ),
      child: body,
    );
  }
}
