import 'package:flutter/material.dart';

import 'package:haus_steuerung/pages/room_overview.dart';
import 'package:haus_steuerung/extensions/raspi.dart';

var raspiHandler = Raspi();

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smart Home by Kath',
      theme: ThemeData(
        primaryColor: Color.fromRGBO(153, 0, 51, 1),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: RoomPage(),
    );
  }
}
