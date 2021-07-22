import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';

class ThirdDriver {
  WidgetTester tester;

  ThirdDriver(this.tester);

  Future<void> thirdBackFlux() async {
    final Finder backThird = find.byKey(Key('close_third_button'));
    await tester.pump(new Duration(milliseconds: 200));
    await tester.tap(backThird);
    await Future.delayed(Duration(milliseconds: 500));
  }
}
