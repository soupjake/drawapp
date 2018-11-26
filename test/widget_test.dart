// This is a basic Flutter widget test.
// To perform an interaction with a widget in your test, use the WidgetTester utility that Flutter
// provides. For example, you can send tap and scroll gestures. You can also use WidgetTester to
// find child widgets in the widget tree, read text, and verify that the values of widget properties
// are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:drawapp/app.dart';
import './color_dialog_tester.dart';

void main() {
  testWidgets('Clicking brush FAB displays mini fabs', (tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(new DrawApp());

    expect(find.byIcon(Icons.brush), findsOneWidget);

    expect(find.byIcon(Icons.clear), findsNothing);
    expect(find.byIcon(Icons.lens), findsNothing);
    expect(find.byIcon(Icons.color_lens), findsNothing);

    await tester.tap(find.byIcon(Icons.brush));
    await tester.pumpAndSettle();

    expect(find.byIcon(Icons.clear), findsOneWidget);
    expect(find.byIcon(Icons.lens), findsOneWidget);
    expect(find.byIcon(Icons.color_lens), findsOneWidget);
  });

  testWidgets('Clicking brush FAB twice hides mini fabs', (tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(new DrawApp());

    expect(find.byIcon(Icons.brush), findsOneWidget);

    expect(find.byIcon(Icons.clear), findsNothing);
    expect(find.byIcon(Icons.lens), findsNothing);
    expect(find.byIcon(Icons.color_lens), findsNothing);

    await tester.tap(find.byIcon(Icons.brush));
    await tester.pumpAndSettle();

    await tester.tap(find.byIcon(Icons.brush));
    await tester.pumpAndSettle();

    expect(find.byIcon(Icons.clear), findsNothing);
    expect(find.byIcon(Icons.lens), findsNothing);
    expect(find.byIcon(Icons.color_lens), findsNothing);
  });

  testWidgets('Clicking the lens icon brings up the Brush thickness panel',
      (tester) async {
    await tester.pumpWidget(new DrawApp());

    expect(find.byIcon(Icons.brush), findsOneWidget);

    expect(find.text('Brush thickness'), findsNothing);

    await tester.tap(find.byIcon(Icons.brush));
    await tester.pumpAndSettle();

    expect(find.byIcon(Icons.lens), findsOneWidget);

    await tester.tap(find.byIcon(Icons.lens));
    await tester.pumpAndSettle();

    expect(find.text('Brush thickness'), findsOneWidget);
    expect(find.text('CANCEL'), findsOneWidget);

    await tester.tap(find.text('CANCEL'));
    await tester.pumpAndSettle();

    expect(find.text('Brush thickness'), findsNothing);
  });

  testWidgets('Clicking the color lens icon brings up the Brush color panel',
      (tester) async {
    await tester.pumpWidget(new DrawApp());

    expect(find.byIcon(Icons.brush), findsOneWidget);

    expect(find.text('Brush color'), findsNothing);

    await tester.tap(find.byIcon(Icons.brush));
    await tester.pumpAndSettle();

    expect(find.byIcon(Icons.color_lens), findsOneWidget);

    await tester.tap(find.byIcon(Icons.color_lens));
    await tester.pumpAndSettle();

    expect(find.text('Brush color'), findsOneWidget);
    expect(
        find.byWidgetPredicate((widget) =>
            widget is FloatingActionButton &&
            widget.backgroundColor == Colors.red),
        findsOneWidget);

    await tester.tap(find.byWidgetPredicate((widget) =>
        widget is FloatingActionButton &&
        widget.backgroundColor == Colors.red));
    await tester.pumpAndSettle();
    expect(find.text('Brush color'), findsNothing);
  });

  testWidgets('Test Color Dialog', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        title: 'DrawApp',
        home: Scaffold(
          appBar: AppBar(
            title: Text('Color Dialog Tester'),
          ),
          body: ColorDialogTester(),
        ),
      ),
    );

    expect(find.text('Select Color'), findsOneWidget);
    expect(find.text('Selected color null'), findsOneWidget);
    
    await tester.tap(find.text('Select Color'));
    await tester.pumpAndSettle();

    expect(find.text('Brush color'), findsOneWidget);
    expect(
        find.byWidgetPredicate((widget) =>
            widget is FloatingActionButton &&
            widget.backgroundColor == Colors.red),
        findsOneWidget);

    await tester.tap(find.byWidgetPredicate((widget) =>
        widget is FloatingActionButton &&
        widget.backgroundColor == Colors.red));
    await tester.pumpAndSettle();

    expect(find.text('Brush color'), findsNothing);
    expect(find.text('Selected color Color(0xfff44336)'), findsOneWidget);
  });
}
