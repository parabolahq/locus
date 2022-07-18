import 'package:flutter/widgets.dart';
import 'package:locus/src/core/theme.dart';

class LocusScaffold extends StatelessWidget {
  final Widget body;
  final PreferredSizeWidget? navigationBar;

  const LocusScaffold({
    super.key,
    required this.body,
    this.navigationBar,
  });

  @override
  Widget build(BuildContext context) {
    final theme = LocusTheme.of(context);
    var existingMediaQuery = MediaQuery.of(context);

    if (navigationBar != null) {
      final padding = EdgeInsets.only(top: MediaQuery.of(context).padding.top + navigationBar!.preferredSize.height);
      existingMediaQuery = existingMediaQuery.copyWith(padding: padding);
    }

    return DecoratedBox(
      decoration: BoxDecoration(
        color: theme.backgroundColor,
      ),
      child: MediaQuery(
        data: existingMediaQuery,
        child: Stack(
          children: [
            body,
            if (navigationBar != null)
              Container(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).padding.top,
                ),
                alignment: Alignment.topCenter,
                child: navigationBar,
              )
          ],
        ),
      ),
    );
  }
}
