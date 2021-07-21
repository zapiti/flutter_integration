// Imports the Flutter Driver API.


import 'package:flutter_driver/flutter_driver.dart';


Future<void> secundaryDriver(FlutterDriver driver) async {
  final btnOpen = find.byValueKey("next_to_third_button");
  await driver.tap(btnOpen);
  return;
}
