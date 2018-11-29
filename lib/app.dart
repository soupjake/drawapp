import 'package:drawapp/draw_page.dart';
import 'package:drawapp/bloc/painter_bloc.dart';
import 'package:flutter/material.dart';

class DrawApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DrawApp',
      home: Scaffold(
        appBar: AppBar(
          title: Text('DrawApp'),
        ),
        body: BlocProvider<PainterBloc>(
          child: DrawPage(),
          bloc: PainterBloc(),
        ),
      ),
    );
  }
}
