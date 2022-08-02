import 'package:flutter/widgets.dart';
import 'package:locus/src/components/card.dart';
import 'package:locus/src/components/icons.dart';
import 'package:locus/src/core/animations.dart';
import 'package:locus/src/core/colors.dart';
import 'package:locus/src/core/hero_tag.dart';
import 'package:locus/src/core/theme.dart';

class LocusTabBar extends StatefulWidget with PreferredSizeWidget {
  final Object heroTag;

  const LocusTabBar({
    super.key,
    this.heroTag = kDefaultHeroTag,
  });

  @override
  State<LocusTabBar> createState() => _LocusTabBarState();

  @override
  Size get preferredSize => Size(200, 40);
}

class _LocusTabBarState extends State<LocusTabBar>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    var controller = PrimaryScrollController.of(context);

    return Hero(
      tag: widget.heroTag == kDefaultHeroTag
          ? HeroTag(Navigator.of(context))
          : widget.heroTag,
      child: AnimatedBuilder(
        animation: controller!.position.isScrollingNotifier,
        builder: (BuildContext context, Widget? child) {
          return TweenAnimationBuilder(
            builder: (BuildContext context, double value, Widget? child) {
              return LocusCard.acrylic(
                borderRadius:
                    BorderRadius.circular(widget.preferredSize.height / 2),
                padding: EdgeInsets.all(3 + 2 * value),
                constraints: BoxConstraints.tight(
                  Size.lerp(Size(60, 10), widget.preferredSize, value)!,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Opacity(
                        child: Icon(LocusIcons.user),
                        opacity: value * .25,
                      ),
                    ),
                    Expanded(
                      child: LocusCard(
                        constraints: BoxConstraints.expand(),
                        color: Color.lerp(
                          LocusColors.grey,
                          LocusTheme.of(context).colorScheme.surface,
                          value,
                        ),
                        child: Opacity(
                          child: Icon(LocusIcons.calendar),
                          opacity: value,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Opacity(
                        child: Icon(LocusIcons.bookmark),
                        opacity: value * .25,
                      ),
                    ),
                  ],
                ),
              );
            },
            duration: kTabBarTransitionDuration,
            curve: Curves.easeInOutCubicEmphasized,
            tween: Tween<double>(
              begin: 1,
              end: controller.position.isScrollingNotifier.value ? 0 : 1,
            ),
          );
        },
      ),
    );
  }
}
