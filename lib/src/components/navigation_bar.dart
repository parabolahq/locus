import 'package:flutter/widgets.dart';
import 'package:locus/src/core/theme.dart';

class NavigationBar extends StatelessWidget {
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(250),
        color: Color.fromRGBO(230, 230, 230, 1),
      ),
      constraints: BoxConstraints.expand(height: 50),
      alignment: Alignment.center,
      child: Text(
        'Settings',
        style: LocusTheme.of(context).typography.body1,
      ),
    );
  }
}
