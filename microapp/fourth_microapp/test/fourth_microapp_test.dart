import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Future<void> fourthBackFlux(WidgetTester tester) async {
  final Finder backFour = find.byKey(Key('close_fourth_button'));
  await tester.pump(new Duration(milliseconds: 200));
  await tester.tap(backFour);
  await Future.delayed(Duration(milliseconds: 500));
}