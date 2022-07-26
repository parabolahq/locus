import 'package:flutter/widgets.dart';
import 'package:locus/src/components/buttons/base_button.dart';
import 'package:locus/src/core/theme.dart';

class LocusIconButton extends StatelessWidget {
  final Widget child;
  final Function onTap;

  const LocusIconButton({
    super.key,
    required this.child,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return LocusButton(
      constraints: BoxConstraints.expand(width: 40),
      color: LocusTheme.of(context).colorScheme.surface,
      onTap: onTap,
      child: child,
    );
  }
}
