import 'package:flutter/widgets.dart';

import 'package:locus/src/components/interactable.dart';
import 'package:locus/src/core/colors.dart';
import 'package:locus/src/core/theme.dart';

class PushButton extends StatelessWidget {
  final Widget child;
  final LocusColorScheme? _colorScheme;
  final Function onTap;

  const PushButton({
    super.key,
    required this.child,
    required this.onTap,
    LocusColorScheme? colorScheme,
  }) : _colorScheme = colorScheme;

  @override
  Widget build(BuildContext context) {
    final effectiveColorScheme =
        _colorScheme ?? LocusTheme.of(context).colorScheme;

    return LocusTheme(
      data: LocusTheme.of(context).copyWith(
        colorScheme: effectiveColorScheme,
      ),
      child: DefaultTextStyle(
        style: LocusTheme.of(context).typography.body1,
        child: Interactable(
          child: Container(
            decoration: BoxDecoration(
              color: LocusTheme.of(context).colorScheme.controlsSurface,
              borderRadius: BorderRadius.circular(20),
            ),
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                child,
              ],
            ),
          ),
          onTap: onTap,
        ),
      ),
    );
  }
}
