import 'package:flutter/material.dart';
import 'package:drawapp/width_dialog.dart';

class WidthDialogTester extends StatefulWidget {
  @override
  State<WidthDialogTester> createState() {
    return WidthDialogTestingState();
  }
}

class WidthDialogTestingState extends State<WidthDialogTester> {
  double strokeWidth = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Center(
          child: MaterialButton(
            child: Text('Select Stroke Width'),
            onPressed: () async {
              var temp = await showDialog(
                context: context,
                builder: (context) => WidthDialog(strokeWidth: 10.0,),
              );
              setState(() {
                strokeWidth = temp;
              });
            },
          ),
        ),
        Text('Selected width $strokeWidth'),
      ],
    );
  }
}
