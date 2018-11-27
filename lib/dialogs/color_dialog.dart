import 'package:flutter/material.dart';

class ColorDialog extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ColorDialogState();
}

class ColorDialogState extends State<ColorDialog> {
  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
        title: Text('Brush color'),
        contentPadding: const EdgeInsets.all(12.0),
        children: <Widget>[
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                FloatingActionButton(
                    mini: true,
                    backgroundColor: Colors.pink,
                    elevation: 1.0,
                    onPressed: () {
                      Navigator.pop(context, Colors.pink[500]);
                    }),
                FloatingActionButton(
                    mini: true,
                    backgroundColor: Colors.red,
                    elevation: 1.0,
                    onPressed: () {
                      Navigator.pop(context, Colors.red[500]);
                    }),
                FloatingActionButton(
                    mini: true,
                    backgroundColor: Colors.deepOrange,
                    elevation: 1.0,
                    onPressed: () {
                      Navigator.pop(context, Colors.deepOrange[500]);
                    }),
                FloatingActionButton(
                    mini: true,
                    backgroundColor: Colors.orange,
                    elevation: 1.0,
                    onPressed: () {
                      Navigator.pop(context, Colors.orange[500]);
                    }),
              ]),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                FloatingActionButton(
                    mini: true,
                    backgroundColor: Colors.amber,
                    elevation: 1.0,
                    onPressed: () {
                      Navigator.pop(context, Colors.amber[500]);
                    }),
                FloatingActionButton(
                    mini: true,
                    backgroundColor: Colors.yellow,
                    elevation: 1.0,
                    onPressed: () {
                      Navigator.pop(context, Colors.yellow[500]);
                    }),
                FloatingActionButton(
                    mini: true,
                    backgroundColor: Colors.lightGreen,
                    elevation: 1.0,
                    onPressed: () {
                      Navigator.pop(context, Colors.lightGreen[500]);
                    }),
                FloatingActionButton(
                    mini: true,
                    backgroundColor: Colors.green,
                    elevation: 1.0,
                    onPressed: () {
                      Navigator.pop(context, Colors.green[500]);
                    }),
              ]),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                FloatingActionButton(
                    mini: true,
                    backgroundColor: Colors.teal,
                    elevation: 1.0,
                    onPressed: () {
                      Navigator.pop(context, Colors.teal[500]);
                    }),
                FloatingActionButton(
                    mini: true,
                    backgroundColor: Colors.cyan,
                    elevation: 1.0,
                    onPressed: () {
                      Navigator.pop(context, Colors.cyan[500]);
                    }),
                FloatingActionButton(
                    mini: true,
                    backgroundColor: Colors.lightBlue,
                    elevation: 1.0,
                    onPressed: () {
                      Navigator.pop(context, Colors.lightBlue[500]);
                    }),
                FloatingActionButton(
                    mini: true,
                    backgroundColor: Colors.blue,
                    elevation: 1.0,
                    onPressed: () {
                      Navigator.pop(context, Colors.blue[500]);
                    }),
              ]),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                FloatingActionButton(
                    mini: true,
                    backgroundColor: Colors.indigo,
                    elevation: 1.0,
                    onPressed: () {
                      Navigator.pop(context, Colors.indigo[500]);
                    }),
                FloatingActionButton(
                    mini: true,
                    backgroundColor: Colors.purple,
                    elevation: 1.0,
                    onPressed: () {
                      Navigator.pop(context, Colors.purple[500]);
                    }),
                FloatingActionButton(
                    mini: true,
                    backgroundColor: Colors.deepPurple,
                    elevation: 1.0,
                    onPressed: () {
                      Navigator.pop(context, Colors.deepPurple[500]);
                    }),
                FloatingActionButton(
                    mini: true,
                    backgroundColor: Colors.blueGrey,
                    elevation: 1.0,
                    onPressed: () {
                      Navigator.pop(context, Colors.blueGrey[500]);
                    }),
              ]),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                FloatingActionButton(
                    mini: true,
                    backgroundColor: Colors.brown,
                    elevation: 1.0,
                    onPressed: () {
                      Navigator.pop(context, Colors.brown[500]);
                    }),
                FloatingActionButton(
                    mini: true,
                    backgroundColor: Colors.grey,
                    elevation: 1.0,
                    onPressed: () {
                      Navigator.pop(context, Colors.grey[500]);
                    }),
                FloatingActionButton(
                    mini: true,
                    backgroundColor: Colors.black,
                    elevation: 1.0,
                    onPressed: () {
                      Navigator.pop(context, Colors.black);
                    }),
                FloatingActionButton(
                    mini: true,
                    backgroundColor: Colors.white,
                    elevation: 1.0,
                    onPressed: () {
                      Navigator.pop(context, Colors.white);
                    }),
              ]),
        ]);
  }
}
