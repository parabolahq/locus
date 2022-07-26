import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:locus/src/core/animations.dart';
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

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: theme.systemUiOverlayStyle,
      child: AnimatedContainer(
        duration: kPageTransitionDuration,
        decoration: BoxDecoration(
          color: theme.colorScheme.surface,
        ),
        child: Stack(
          children: [
            body,
            if (navigationBar != null)
              Container(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).padding.bottom + 60,
                ),
                alignment: Alignment.bottomCenter,
                child: ConstrainedBox(
                  child: navigationBar!,
                  constraints:
                      BoxConstraints.tight(navigationBar!.preferredSize),
                ),
              )
          ],
        ),
      ),
    );
  }
}
