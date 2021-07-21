import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';

void secundaryDriver(Function main ) async {
  final Finder next = find.byKey(Key('next_to_third_button'));
  testWidgets('tap on the floating action button; verify counter',
  (WidgetTester tester) async {

    await tester.pumpAndSettle();
    print("entroooooo");
    await tester.pump(Duration(milliseconds: 500));
    await Future.delayed(Duration(milliseconds: 5000));
    await tester.tap(next);
    await Future.delayed(Duration(milliseconds: 5000));
  });
}
