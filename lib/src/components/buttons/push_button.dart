import 'package:flutter/widgets.dart';
import 'package:locus/src/components/buttons/base_button.dart';
import 'package:locus/src/core/theme.dart';

class LocusPushButton extends StatelessWidget {
  final Widget child;
  final Widget? leading;
  final Function onTap;

  const LocusPushButton({
    super.key,
    required this.child,
    required this.leading,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return LocusButton(
      constraints: BoxConstraints.expand(height: 50),
      onTap: onTap,
      child: DefaultTextStyle(
        style: LocusTheme.of(context).typography.body1,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (leading != null)
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: leading!,
              ),
            child,
          ],
        ),
      ),
    );
  }
}
