import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

class InitialDriver {
  final WidgetTester tester;

  InitialDriver(this.tester);

  Future<void> initialRemoveTest() async {
    final Finder remove = find.byKey(Key('subtract'));
    await tester.tap(remove);
    await Future.delayed(Duration(milliseconds: 200));
  }

  Future<void> initialAddTest() async {
    final Finder fab = find.byTooltip('Increment');
    await tester.tap(fab);
    await Future.delayed(Duration(milliseconds: 200));
  }

  Future<void> initialFluxDriver() async {
    final Finder open = find.byKey(Key('open'));
    await tester.pumpAndSettle();

    await initialAddTest();

    await initialAddTest();

    await initialAddTest();

    await initialAddTest();

    await initialAddTest();

    await tester.tap(open);
  }

  Future<void> finalFluxDriver() async {
    await initialRemoveTest();

    await initialRemoveTest();

    await initialRemoveTest();

    await initialRemoveTest();

    await initialRemoveTest();

    await initialRemoveTest();

    expect(find.text('2'), findsOneWidget);
  }
}
