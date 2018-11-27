import 'package:drawapp/dialogs/color_dialog.dart';
import 'package:flutter/material.dart';

class ColorDialogTester extends StatefulWidget {
  @override
  State<ColorDialogTester> createState() {
    return ColorDialogTestingState();
  }
}

class ColorDialogTestingState extends State<ColorDialogTester> {
  Color color;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Center(
          child: MaterialButton(
            child: Text('Select Color'),
            onPressed: () async {
              var temp = await showDialog(
                context: context,
                builder: (context) => ColorDialog(),
              );
              setState(() {
                color = temp;
              });
            },
          ),
        ),
        Text('Selected color $color'),
      ],
    );
  }
}
