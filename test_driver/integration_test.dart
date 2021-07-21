import 'dart:io';

import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_integration/integration_test/main_driver.dart';
import 'package:fourth_microapp/integration_test/fourth_driver.dart';
import 'package:secundary_microapp/integration_test/secundary_driver.dart';
import 'package:test/test.dart';
import 'package:third_microapp/integration_test/third_driver.dart';

main() {
  group('app', () {
    FlutterDriver? driver;

    // Connect to the Flutter driver before running any tests.
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    mainDriver(driver, (value) async {
      await secundaryDriver(value);
      await thirdDriver(value);
      await fourthDriver(value);
      Future.delayed(Duration(seconds: 0), () => exit(0));
    });

  // Close the connection to the driver after the tests have completed.
  tearDownAll(() async {
    if (driver != null) {
      driver?.close();
    }
  });
});
}
