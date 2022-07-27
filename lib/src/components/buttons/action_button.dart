import 'package:flutter/widgets.dart';
import 'package:locus/src/components/buttons/base_button.dart';
import 'package:locus/src/core/theme.dart';

class LocusActionButton extends StatelessWidget with PreferredSizeWidget {
  final Widget child;
  final Function onTap;
  final Size size;

  const LocusActionButton({
    super.key,
    required this.child,
    required this.onTap,
    this.size = const Size(40, 30),
  });

  const LocusActionButton.large({
    super.key,
    required this.child,
    required this.onTap,
  }) : size = const Size(60, 45);

  @override
  Widget build(BuildContext context) {
    return LocusButton(
      borderRadius: BorderRadius.circular(size.height / 2),
      constraints: BoxConstraints.tight(size),
      color: LocusTheme.of(context).colorScheme.surface,
      onTap: onTap,
      child: child,
    );
  }

  @override
  Size get preferredSize => size;
}
