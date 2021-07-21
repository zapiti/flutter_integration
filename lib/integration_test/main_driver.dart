import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_integration/main.dart' as app;

void mainDriver(Function(WidgetTester) callBack) {
  final Finder fab = find.byTooltip('Increment');
  final Finder remove = find.byKey(Key('subtract'));
  final Finder open = find.byKey(Key('open'));
  final Finder nextSecundary = find.byKey(Key('next_to_third_button'));
  final Finder nextTerceary = find.byKey(Key('next_to_four_button'));

  final Finder backFour = find.byKey(Key('close_fourth_button'));
  final Finder backThird= find.byKey(Key('close_third_button'));
  final Finder backSecond = find.byKey(Key('close_button'));

  group('end-to-end test', () {
    testWidgets('tap on the floating action button; verify counter',
        (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      await tester.tap(fab);
      await Future.delayed(Duration(milliseconds: 200));
      
      await tester.tap(fab);
      await Future.delayed(Duration(milliseconds: 200));
      
      await tester.tap(fab);
      await Future.delayed(Duration(milliseconds: 200));
      
      await tester.tap(fab);
      await Future.delayed(Duration(milliseconds: 200));
      
      await tester.tap(fab);
      await Future.delayed(Duration(milliseconds: 200));
      


      expect(find.text('5'), findsOneWidget);
      await tester.tap(open);
      
      await Future.delayed(Duration(milliseconds: 500));
      
      await tester.tap(nextSecundary);
      await Future.delayed(Duration(milliseconds: 500));
      
      await tester.tap(nextTerceary);
      await Future.delayed(Duration(milliseconds: 500));

      await tester.pump(new Duration(milliseconds: 200));
      await tester.tap(backFour);
      await Future.delayed(Duration(milliseconds: 500));
      await tester.pump(new Duration(milliseconds: 200));
      await tester.tap(backThird);
      await Future.delayed(Duration(milliseconds: 500));
      await tester.pump(new Duration(milliseconds: 200));
      await tester.tap(backSecond);
      await Future.delayed(Duration(milliseconds: 500));


      await tester.tap(remove);
      await Future.delayed(Duration(milliseconds: 200));

      await tester.tap(remove);
      await Future.delayed(Duration(milliseconds: 200));

      await tester.tap(remove);
      await Future.delayed(Duration(milliseconds: 200));

      await tester.tap(remove);
      await Future.delayed(Duration(milliseconds: 200));

      await tester.tap(remove);
      await Future.delayed(Duration(milliseconds: 200));

      await tester.tap(remove);
      await Future.delayed(Duration(milliseconds: 200));

      expect(find.text('2'), findsOneWidget);
    });
  });
}
