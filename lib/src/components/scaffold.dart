import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:locus/src/core/animations.dart';
import 'package:locus/src/core/theme.dart';

class LocusScaffold extends StatelessWidget {
  final Widget body;
  final Widget? top;
  final Widget? bottom;

  const LocusScaffold({
    super.key,
    required this.body,
    this.top,
    this.bottom,
  });

  @override
  Widget build(BuildContext context) {
    final theme = LocusTheme.of(context);
    final mediaQuery = MediaQuery.of(context);

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: theme.systemUiOverlayStyle,
      child: AnimatedContainer(
        duration: kPageTransitionDuration,
        decoration: BoxDecoration(
          color: theme.colorScheme.surface,
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            body,
            Padding(
              padding: EdgeInsets.only(
                bottom: mediaQuery.padding.bottom + mediaQuery.size.height / 8,
                top: mediaQuery.padding.top + 15,
                left: 15,
                right: 15,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (top != null) top!,
                  Spacer(),
                  if (bottom != null) bottom!,
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
