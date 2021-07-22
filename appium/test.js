const wdio = require('webdriverio');
const assert = require('assert');
const find = require('appium-flutter-finder');

const osSpecificOps = process.env.APPIUM_OS === 'android' ? {
  platformName: 'Android',
  deviceName: 'Mi 9T',
  app: __dirname +  '/../build/app/outputs/apk/debug/app-debug.apk',
}: process.env.APPIUM_OS === 'ios' ? {
  platformName: 'iOS',
  platformVersion: '12.2',
  deviceName: 'iPhone X',
  noReset: true,
  app: __dirname +  '/../ios/Runner.zip',

} : {};

const opts = {
  port: 4723,
  capabilities: {
    ...osSpecificOps,
    automationName: 'Flutter'
  }
};

(async () => {
  console.log('Initial app')
  const driver = await wdio.remote(opts);
  assert.strictEqual(await driver.execute('flutter:checkHealth'), 'ok');
  await driver.execute('flutter:clearTimeline');
  await driver.execute('flutter:forceGC');


  //Primeiro fluxo
  await driver.execute('flutter:waitFor', find.byValueKey('open'));
  await driver.elementClick(find.byValueKey('Increment'));
  await driver.elementClick(find.byValueKey('Increment'));
  await driver.elementClick(find.byValueKey('Increment'));
  await driver.elementClick(find.byValueKey('Increment'));
  await driver.elementClick(find.byValueKey('Increment'));
  await driver.elementClick(find.byValueKey('open'));

  //Segundo fluxo
  await driver.execute('flutter:waitFor', find.byValueKey('next_to_third_button'));
  assert.strictEqual(await driver.getElementText(find.byValueKey('secudary_value')), 'Welcome to ExecuteAutomation 5');
  await driver.elementClick(find.byValueKey('next_to_third_button'));

  //Terceiro fluxo
  await driver.execute('flutter:waitFor', find.byValueKey('next_to_four_button'));
  assert.strictEqual(await driver.getElementText(find.byValueKey('third_value')), 'Welcome to ExecuteAutomation 6');
  await driver.elementClick(find.byValueKey('next_to_four_button'));

  //Quarto fluxo
  await driver.execute('flutter:waitFor', find.byValueKey('close_button'));
  assert.strictEqual(await driver.getElementText(find.byValueKey('fourth_value')), 'Welcome to ExecuteAutomation 7');
  await driver.elementClick(find.byValueKey('close_fourth_button'));
  await driver.elementClick(find.byValueKey('close_third_button'));
  await driver.elementClick(find.byValueKey('close_button'));

  //Final
  await driver.execute('flutter:waitFor', find.byValueKey('counterText'));
  await driver.elementClick(find.byValueKey('subtract'));
  await driver.elementClick(find.byValueKey('subtract'));
  await driver.elementClick(find.byValueKey('subtract'));
  await driver.elementClick(find.byValueKey('subtract'));
  await driver.elementClick(find.byValueKey('subtract'));
  await driver.elementClick(find.byValueKey('subtract'));
  assert.strictEqual(await driver.getElementText(find.byValueKey('counterText')), '2');
  driver.deleteSession();

})();