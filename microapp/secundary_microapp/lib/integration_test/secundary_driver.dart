import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';

class SecundaryDriver {
  final WidgetTester tester;

  SecundaryDriver(this.tester);

  Future<void> secundaryFluxDriver() async {
    final Finder nextSecundary = find.byKey(Key('next_to_third_button'));
    final Finder nextTerceary = find.byKey(Key('next_to_four_button'));

    expect(find.text('5'), findsOneWidget);

    await Future.delayed(Duration(milliseconds: 500));

    await tester.tap(nextSecundary);
    await Future.delayed(Duration(milliseconds: 500));

    await tester.tap(nextTerceary);
    await Future.delayed(Duration(milliseconds: 500));
  }

  Future<void> secundaryBackFlux() async {
    final Finder backSecond = find.byKey(Key('close_button'));
    await tester.pump(new Duration(milliseconds: 200));
    await tester.tap(backSecond);
    await Future.delayed(Duration(milliseconds: 500));
  }
}
