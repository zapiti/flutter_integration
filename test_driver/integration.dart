
import 'package:flutter_integration/integration_test/main_driver.dart';
import 'package:integration_test/integration_test.dart';
import 'package:secundary_microapp/integration_test/secundary_driver.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

    mainDriver((value){

      // secundaryDriver(value);
    });

}
