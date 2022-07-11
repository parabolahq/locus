import 'dart:ui';

import 'package:flutter/physics.dart';
import 'package:locus/locus.dart';

void main() {
  runApp(LocusLabApp());
}

class LocusLabApp extends StatefulWidget {
  @override
  State<LocusLabApp> createState() => _LocusLabAppState();
}

class _LocusLabAppState extends State<LocusLabApp> {
  final ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return LocusApp(
      home: LocusScaffold(
        body: Builder(
          builder: (context) {
            return Stack(
              children: [
                ListView.builder(
                  itemBuilder: (context, index) => Container(
                    height: 75,
                  ),
                  controller: controller,
                ),
                Container(
                  alignment: Alignment.topCenter,
                  margin: EdgeInsets.only(
                    top: MediaQuery.of(context).padding.top,
                  ),
                  child: NavigationBar(controller: controller),
                ),
              ],
            );
          },
        ),
      ),
      title: 'Lab',
    );
  }
}

class NavigationBar extends StatefulWidget {
  final ScrollController controller;

  const NavigationBar({super.key, required this.controller});

  @override
  State<NavigationBar> createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar>
    with TickerProviderStateMixin {
  double value = 1;

  @override
  void initState() {
    super.initState();

    widget.controller.position.isScrollingNotifier.addListener(() {
      var newValue =
          widget.controller.position.isScrollingNotifier.value ? 0 : 1;

      if (newValue != value) {
        setState(() => value = newValue.toDouble());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      builder: (BuildContext context, double value, Widget? child) {
        return ClipRRect(
          clipBehavior: Clip.antiAlias,
          borderRadius: BorderRadius.circular(40),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              height: 10 + 30 * value,
              width: 60 + 140 * value,
              color: Color.fromRGBO(230, 230, 230, .8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  '1',
                  '2',
                  '3',
                ].map((e) {
                  var base = Visibility(
                    visible: value > 0,
                    child: Transform.scale(
                      child: Text(e),
                      scale: value,
                    ),
                  );

                  if (e != '2') return base;

                  return Container(
                    alignment: Alignment.center,
                    height: 5 + 25 * value,
                    width: 16 + 50 * value,
                    decoration: BoxDecoration(
                      color: Color.lerp(Color.fromRGBO(140, 140, 140, .5),
                          Color.fromRGBO(255, 255, 255, 1), value),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: base,
                  );
                }).toList(),
              ),
            ),
          ),
        );
      },
      duration: const Duration(milliseconds: 250),
      tween: Tween<double>(begin: 0, end: value),
      curve: Curves.easeOutCubic,
    );
  }
}
