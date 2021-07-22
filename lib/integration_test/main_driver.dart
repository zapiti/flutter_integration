import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_integration/main.dart' as app;
import 'package:secundary_microapp/integration_test/secundary_driver.dart';
import 'package:third_microapp/integration_test/third_driver.dart';
import 'package:fourth_microapp/integration_test/fourth_driver.dart';

import 'initial_driver.dart';

void mainDriver() {
  group('Flux test', () {
    testWidgets('make test on complet flux', (WidgetTester tester) async {
      app.main();
      final pageInitial = InitialDriver(tester);
      final pageSecundary = SecundaryDriver(tester);
      final pageTerceary = ThirdDriver(tester);
      final pageFour = FourthDriver(tester);

      //'primeiroFluxo'
      await pageInitial.initialFluxDriver();
      await pageSecundary.secundaryFluxDriver();

      //'secundoFluxo'
      await pageFour.fourthBackFlux();
      await pageTerceary.thirdBackFlux();
      await pageSecundary.secundaryBackFlux();

      //'terceiroFluxo'
      await pageInitial.finalFluxDriver();
    });
  });
}
