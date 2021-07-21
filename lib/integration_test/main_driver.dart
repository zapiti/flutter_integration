// Imports the Flutter Driver API.
import 'dart:io';

import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void mainDriver(FlutterDriver? driver, Function(FlutterDriver) callBack) {
  group('Main App', () {
    final counterTextFinder = find.byValueKey('counterText');
    final buttonFinder = find.byTooltip('Increment');
    final buttonOpen = find.byValueKey("open");
    // final buttonSubtract = find.byValueKey("subtract");
    // final secundaryValue = find.byValueKey("secudary_value");
    // final btnClose = find.byValueKey("close_button");

    setUpAll(() async {
      driver = driver ?? await FlutterDriver.connect();
    });

    test('Increment the counter', () async {
      await driver?.tap(buttonFinder);

      expect(await driver?.getText(counterTextFinder), "1");

      await driver?.tap(buttonFinder);

      expect(await driver?.getText(counterTextFinder), "2");

      await driver?.tap(buttonFinder);
      expect(await driver?.getText(counterTextFinder), "3");
      await driver?.tap(buttonFinder);
      expect(await driver?.getText(counterTextFinder), "4");
      await driver?.tap(buttonFinder);
    });

    test("Test with alert window", () async {
      await driver?.tap(buttonOpen);

      // expect(
      //     await driver?.getText(secundaryValue), "Welcome to ExecuteAutomation 5");
      //
      // await driver?.tap(btnClose);
      //
      // await driver?.tap(buttonSubtract);

      // expect(await driver?.getText(counterTextFinder), "4");
      callBack(driver!);
    });
  });
}
