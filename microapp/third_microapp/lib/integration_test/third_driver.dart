// Imports the Flutter Driver API.
import 'dart:io';

import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

Future<void> thirdDriver(FlutterDriver driver) async {
  final btnOpen = find.byValueKey("next_to_four_button");
  await driver.tap(btnOpen);
  return;
}
