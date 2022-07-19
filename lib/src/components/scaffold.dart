import 'package:flutter/widgets.dart';
import 'package:locus/src/core/theme.dart';

class LocusScaffold extends StatelessWidget {
  final Widget body;
  final Widget? navigationBar;

  const LocusScaffold({
    super.key,
    required this.body,
    this.navigationBar,
  });

  @override
  Widget build(BuildContext context) {
    final theme = LocusTheme.of(context);
    return DecoratedBox(
      decoration: BoxDecoration(
        color: theme.backgroundColor,
      ),
      child: Stack(
        children: [
          body,
          if (navigationBar != null)
            Container(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).padding.bottom + 60,
                left: 60,
                right: 60,
              ),
              alignment: Alignment.bottomCenter,
              child: navigationBar,
            )
        ],
      ),
    );
  }
}
