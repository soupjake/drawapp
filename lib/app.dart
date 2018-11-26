import 'package:drawapp/home_page.dart';
import 'package:flutter/material.dart';

class DrawApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DrawApp',
      home: HomePage(title: "DrawApp"),
    );
  }
}
