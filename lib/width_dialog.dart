import 'package:flutter/material.dart';

class WidthDialog extends StatefulWidget {
  final double strokeWidth;

  WidthDialog({this.strokeWidth});

  @override
  State<StatefulWidget> createState() => WidthDialogState();
}

class WidthDialogState extends State<WidthDialog> {
  double strokeWidth;
  
  @override
  void initState() {
      super.initState();
      strokeWidth = widget.strokeWidth;
    }

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
        title: Text("Brush thickness"),
        contentPadding: const EdgeInsets.all(12.0),
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 24.0, bottom: 24.0),
            child:
            Container(
              width: strokeWidth,
              height: strokeWidth,
              decoration: new BoxDecoration(
                color: Colors.black,
                shape: BoxShape.circle
              ),
            )),
            Slider(
              value: strokeWidth,
              min: 1.0,
              max: 20.0,
              onChanged: (d) {
                setState(() {
                  strokeWidth = d;
                });
              },
            ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FlatButton(
                  child: Text(
                    "CANCEL",
                    style: TextStyle(color: ThemeData().accentColor),
                  ),
                  onPressed: () async {
                    Navigator.pop(context);
                  }),
              FlatButton(
                  child: Text(
                    "ACCEPT",
                    style: TextStyle(color: ThemeData().accentColor),
                  ),
                  onPressed: () async {
                    Navigator.pop(context, strokeWidth);
                  }),
            ],
          )
        ]);
  }
}
