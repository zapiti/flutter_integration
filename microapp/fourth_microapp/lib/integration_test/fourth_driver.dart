import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';

class FourthDriver {
  WidgetTester tester;

  FourthDriver(this.tester);

  Future<void> fourthBackFlux() async {
    final Finder backFour = find.byKey(Key('close_fourth_button'));
    await tester.pump(new Duration(milliseconds: 200));
    await tester.tap(backFour);
    await Future.delayed(Duration(milliseconds: 500));
  }
}
