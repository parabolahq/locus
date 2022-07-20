import 'package:flutter/widgets.dart';

import 'package:locus/src/components/interactable.dart';
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

class NavigationBar extends StatefulWidget {
  final Widget? middle;
  final Object heroTag;

  const NavigationBar({
    super.key,
    this.middle,
    this.heroTag = kDefaultHeroTag,
  });

  @override
  State<NavigationBar> createState() => _NavigationBarState();
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
      child: Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(250),
          color: LocusTheme.of(context).colorScheme.controlsSurface,
        ),
        padding: const EdgeInsets.all(10),
        constraints: BoxConstraints.expand(height: 50, width: 280),
        child: Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  if (useCloseButton)
                    Interactable(
                      onTap: () => Navigator.of(context).pop(),
                      child: Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          color: LocusTheme.of(context).colorScheme.surface,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          'Back',
                          style: TextStyle(
                            color: LocusTheme.of(context)
                                .colorScheme
                                .onControlsSurface,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
            if (widget.middle != null)
              DefaultTextStyle(
                style: LocusTheme.of(context).typography.title,
                child: widget.middle!,
              ),
            Expanded(
              child: Row(
                children: [],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
