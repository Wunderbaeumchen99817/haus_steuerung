import 'package:flutter/material.dart';

import 'package:haus_steuerung/pages/custom_page.dart';
import 'package:haus_steuerung/custom_widgets/custom_text.dart';

var rooms = [ "Flur",
              "Gäste-WC",
              "HWR",
              "Stube",
              "Küche",
              "Galerie",
              "Bad",
              "Alexandra",
              "Katharina",
              "Schlafzimmer"];

class RoomPage extends StatefulWidget {
  RoomPageState createState() => RoomPageState();
}

class RoomPageState extends State<RoomPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: customText("Raumübersicht")
        ),
        body: ListView.builder(
        itemCount: rooms.length,
        itemBuilder: (context,index) {
          return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              elevation: 1.5,
              child: ListTile(
                title: Text(rooms[index],
                  style: TextStyle(
                    fontSize: 30,
                    fontStyle: FontStyle.italic,
                    fontFamily: "Open Sans",
                  ),
                ),
                onLongPress: () async {
                  await Navigator.push(context,
                      MaterialPageRoute(
                          builder:(context)=> CustomPage(
                            title: rooms[index]
                          )
                      )
                  );
                },
              )
            );
          }
      )
    );
  }
}