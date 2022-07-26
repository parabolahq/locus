import 'package:flutter/widgets.dart';
import 'package:locus/src/components/card.dart';
import 'package:locus/src/components/interactable.dart';

class LocusButton extends StatelessWidget {
  final Widget child;
  final Function onTap;
  final Color? color;
  final BoxConstraints? constraints;
  final BorderRadius? borderRadius;

  const LocusButton({
    super.key,
    required this.child,
    required this.onTap,
    this.color,
    this.constraints,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Interactable(
      onTap: onTap,
      child: LocusCard(
        color: color,
        constraints: constraints,
        borderRadius: borderRadius,
        child: child,
      ),
    );
  }
}
