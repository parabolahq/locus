import 'dart:ui';

import 'package:flutter/widgets.dart';
import 'package:locus/src/core/animations.dart';
import 'package:locus/src/core/colors.dart';

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

    return Semantics(
      scopesRoute: true,
      explicitChildNodes: true,
      child: SlideTransition(
        position: animation.drive(
          Tween<Offset>(
            begin: Offset(0, 1),
            end: Offset(0, 0),
          ),
        ),
        child: result,
      ),
    );
  }

  @override
  Color? get barrierColor => LocusColors.lightGrey;

  @override
  String? get barrierLabel => _barrierLabel;

  @override
  bool get maintainState => _maintainState;

  @override
  Duration get transitionDuration => kPageTransitionDuration;
}
