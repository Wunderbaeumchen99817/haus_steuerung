import 'package:flutter/material.dart';
import 'package:haus_steuerung/custom_widgets/custom_text.dart';

class CustomBar extends StatelessWidget implements PreferredSizeWidget{
  final title;
  final status;
  CustomBar({@required this.title, @required this.status});
  var state;
  @override
  Widget build(BuildContext context) {
    if (this.status) {
      state = "Heizung heizt";
    } else {
      state = "Heizung ist aus";
    }
    return AppBar(
      title: this.title,
      actions: [
        customText("Status: $state")
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(50);
}