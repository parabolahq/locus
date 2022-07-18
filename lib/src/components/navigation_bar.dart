import 'package:flutter/widgets.dart';

class NavigationBar extends StatefulWidget implements PreferredSizeWidget {
  @override
  State<NavigationBar> createState() => _NavigationBarState();

  @override
  Size get preferredSize => Size(190, 40);
}

class _NavigationBarState extends State<NavigationBar>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.tight(widget.preferredSize),
      color: Color.fromRGBO(255, 120, 120, 1),
      child: Text('Hello, world'),
    );
  }
}
