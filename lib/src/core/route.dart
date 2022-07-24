import 'dart:ui';

import 'package:flutter/widgets.dart';
import 'package:locus/src/core/animations.dart';

class LocusPageRoute<T> extends PageRoute<T> {
  final bool _maintainState;
  final String? _barrierLabel;
  final WidgetBuilder _builder;

  LocusPageRoute({
    required WidgetBuilder builder,
    super.settings,
    String? barrierLabel,
    bool maintainState = true,
    super.fullscreenDialog = false,
  })  : _maintainState = maintainState,
        _barrierLabel = barrierLabel,
        _builder = builder;

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) {
    final Widget result = _builder(context);
    final Animation<double> curved =
        animation.drive(CurveTween(curve: Curves.easeInOutCubic));

    return Semantics(
      scopesRoute: true,
      explicitChildNodes: true,
      child: AnimatedBuilder(
        animation: curved,
        builder: (BuildContext context, Widget? child) {
          return BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: curved.value * 10,
              sigmaY: curved.value * 10,
            ),
            child: Transform.translate(
              offset: Offset(
                0,
                MediaQuery.of(context).size.height * (1 - curved.value),
              ),
              child: child,
            ),
          );
        },
        child: result,
      ),
    );
  }

  @override
  Color? get barrierColor => Color.fromRGBO(0, 0, 0, 180);

  @override
  String? get barrierLabel => _barrierLabel;

  @override
  bool get maintainState => _maintainState;

  @override
  Duration get transitionDuration => kPageTransitionDuration;
}
