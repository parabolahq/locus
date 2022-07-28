import 'package:flutter/widgets.dart';
import 'package:locus/src/components/buttons/action_button.dart';
import 'package:locus/src/components/card.dart';
import 'package:locus/src/components/icons.dart';
import 'package:locus/src/core/hero_tag.dart';
import 'package:locus/src/core/theme.dart';

class LocusNavigationBar extends StatefulWidget with PreferredSizeWidget {
  final Widget middle;
  final Object heroTag;
  final List<Widget> actions;

  const LocusNavigationBar({
    super.key,
    required this.middle,
    this.actions = const [],
    this.heroTag = kDefaultHeroTag,
  }) : assert(actions.length <= 2);

  @override
  State<LocusNavigationBar> createState() => _LocusNavigationBarState();

  @override
  Size get preferredSize => Size(280, 50);
}

class _LocusNavigationBarState extends State<LocusNavigationBar> {
  Widget build(BuildContext context) {
    final ModalRoute<dynamic>? parentRoute = ModalRoute.of(context);
    final bool useCloseButton =
        parentRoute is PageRoute<dynamic> && parentRoute.canPop;

    return Hero(
      tag: widget.heroTag == kDefaultHeroTag
          ? HeroTag(Navigator.of(context))
          : widget.heroTag,
      child: LocusCard.acrylic(
        constraints: BoxConstraints.tight(widget.preferredSize),
        borderRadius: BorderRadius.circular(widget.preferredSize.height / 2),
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  if (useCloseButton)
                    LocusActionButton(
                      child: Icon(LocusIcons.arrow_left),
                      onTap: () => Navigator.of(context).pop(),
                    ),
                ],
              ),
            ),
            DefaultTextStyle(
              style: LocusTheme.of(context).typography.body1,
              child: widget.middle,
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: widget.actions,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
