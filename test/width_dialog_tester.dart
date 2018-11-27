import 'package:drawapp/dialogs/width_dialog.dart';
import 'package:flutter/material.dart';

class WidthDialogTester extends StatefulWidget {
  final double initialWidth;

  WidthDialogTester({@required this.initialWidth});

  @override
  State<WidthDialogTester> createState() {
    return WidthDialogTestingState(initialWidth);
  }
}

class WidthDialogTestingState extends State<WidthDialogTester> {
  final double initialWidth;
  double strokeWidth = 0;

  WidthDialogTestingState(this.initialWidth);

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
                builder: (context) => WidthDialog(
                      strokeWidth: initialWidth,
                    ),
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
