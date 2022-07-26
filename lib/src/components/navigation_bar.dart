import 'package:flutter/widgets.dart';
import 'package:locus/src/components/buttons/action_button.dart';
import 'package:locus/src/components/card.dart';
import 'package:locus/src/components/icons.dart';
import 'package:locus/src/core/theme.dart';

// There's a single tag for all instances of navigation bars because they can
// all transition between each other (per Navigator) via Hero transitions.
const _HeroTag kDefaultHeroTag = _HeroTag(null);

@immutable
class _HeroTag {
  const _HeroTag(this.navigator);

  final NavigatorState? navigator;

  @override
  String toString() =>
      'Default Hero tag for Locus navigation bars with navigator $navigator';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    if (other.runtimeType != runtimeType) return false;

    return other is _HeroTag && other.navigator == navigator;
  }

  @override
  int get hashCode => identityHashCode(navigator);
}

class NavigationBar extends StatefulWidget with PreferredSizeWidget {
  final Widget middle;
  final Object heroTag;
  final List<Widget> actions;

  const NavigationBar({
    super.key,
    required this.middle,
    this.actions = const [],
    this.heroTag = kDefaultHeroTag,
  }) : assert(actions.length <= 2);

  @override
  State<NavigationBar> createState() => _NavigationBarState();

  @override
  Size get preferredSize => Size(280, 50);
}

class _NavigationBarState extends State<NavigationBar> {
  Widget build(BuildContext context) {
    final ModalRoute<dynamic>? parentRoute = ModalRoute.of(context);
    final bool useCloseButton =
        parentRoute is PageRoute<dynamic> && parentRoute.canPop;

    return Hero(
      tag: widget.heroTag == kDefaultHeroTag
          ? _HeroTag(Navigator.of(context))
          : widget.heroTag,
      child: LocusCard.acrylic(
        constraints: BoxConstraints.tight(widget.preferredSize),
        borderRadius: BorderRadius.circular(widget.preferredSize.height / 2),
        color: LocusTheme.of(context).colorScheme.controlsSurface,
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
              style: LocusTheme.of(context).typography.title,
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
