import 'package:flutter/material.dart';

class CustomBar extends StatelessWidget implements PreferredSizeWidget{
  final title;
  final status;
  CustomBar({@required this.title, @required this.status});
  var icon;
  @override
  Widget build(BuildContext context) {
    if (this.status) {
      icon = Icon(Icons.highlight);
    } else {
      icon = Icon(Icons.lightbulb_outline);
    }
    return AppBar(
      title: this.title,
      actions: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0,0,15,0),
          child: icon,
        )
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(50);
}