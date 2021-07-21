// Imports the Flutter Driver API.
import 'dart:io';

import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

Future<void> fourthDriver(FlutterDriver driver) async {
  final btnCloseFour = find.byValueKey("close_fourth_button");
  await driver.tap(btnCloseFour);
  final btnCloseThird = find.byValueKey("close_third_button");
  await driver.tap(btnCloseThird);
  final btnCloseSecond = find.byValueKey("close_button");
  await driver.tap(btnCloseSecond);
  return;
}
