library third_microapp;

import 'package:flutter/material.dart';

class ThirdMicroApp extends StatelessWidget {
  final int _counter;
  final Function(int) callBack;
  ThirdMicroApp(this._counter,this.callBack);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text("Third MicroApp"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Welcome to ExecuteAutomation " + _counter.toString(),
                key: ValueKey("third_value")),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                key: ValueKey("close_third_button"),
                onPressed: () {
                  // Close the screen and return "Nope." as the result.
                  Navigator.pop(context, 'Nope.');
                },
                child: Text('Close'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                key: ValueKey("next_to_four_button"),
                onPressed: () {
                  callBack(_counter+1);
                },
                child: Text('Next'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
