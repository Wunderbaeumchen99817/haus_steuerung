import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

import 'package:haus_steuerung/main.dart';
import 'package:haus_steuerung/custom_widgets/custom_text.dart';
import 'package:haus_steuerung/custom_widgets/custom_bar.dart';

class CustomPage extends StatefulWidget {
  final title;

  CustomPage({@required this.title});

  CustomPageState createState() => CustomPageState();
}

class CustomPageState extends State<CustomPage> {

  int tempSoll = 20;
  int tempIst = 0;
  bool state = true;

  void initState() async {
    super.initState();
    var output = await raspiHandler.get(this.widget.title);
    if (output != null) {
      setState(() {
        tempSoll = output[0];
        tempIst = output[1];
        state = output[2];
      });
    } ///todo error catch
  }

  _failureDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Error"),
          content: new Text("Fehler bei der Übermittlung!"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Okay"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        );
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomBar(
        title: customText(this.widget.title),
        status: state,
      ),
      body: Center(
          child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Spacer(),
                  customText("Temperatur ist: $tempIst"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      customText("Temperatur soll:"),
                      NumberPicker.integer(
                        minValue: 0,
                        maxValue: 40,
                        initialValue: tempIst,
                        onChanged: (newVal) {
                          setState(() {
                            tempSoll = newVal;
                          });
                        },
                      )
                    ]
                  ),
                  Spacer()
                ],
              )
          )
      ),
      bottomSheet: ButtonBar(
        children: <Widget>[
          Ink(
            decoration: ShapeDecoration(
              color: Theme.of(context).primaryColor,
              shape: CircleBorder(),
            ),
            child: IconButton(
              icon: Icon(Icons.check),
              tooltip: "Speichern",
              color: Colors.white,
              onPressed: () => () async {
                var answer = await raspiHandler.send(this.widget.title, tempSoll);
                if (answer) {
                  Navigator.pop(context);
                } else {
                  _failureDialog();
                }
              }
            ),
          ),
        ],
      ),
    );
  }
}