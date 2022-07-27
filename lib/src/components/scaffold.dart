import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:locus/src/core/animations.dart';
import 'package:locus/src/core/theme.dart';

class LocusScaffold extends StatelessWidget {
  final Widget body;
  final PreferredSizeWidget? top;
  final PreferredSizeWidget? bottom;

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
    final paddings = EdgeInsets.only(
      bottom: mediaQuery.padding.bottom + mediaQuery.size.height / 8,
      top: mediaQuery.padding.top,
      left: 15,
      right: 15,
    );

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
            MediaQuery(
              child: body,
              data: mediaQuery.copyWith(
                padding: EdgeInsets.only(
                  top: paddings.top + (top?.preferredSize.height ?? 0),
                ),
              ),
            ),
            Padding(
              padding: paddings,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (top != null) top!,
                  Spacer(),
                  if (bottom != null) bottom!,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
