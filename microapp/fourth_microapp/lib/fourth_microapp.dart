library fourth_microapp;

import 'package:flutter/material.dart';

class FourthMicroApp extends StatelessWidget {
  final int _counter;
  final Function(int) callBack;
  FourthMicroApp(this._counter,this.callBack);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text("Fourth MicroApp"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Welcome to ExecuteAutomation " + _counter.toString(),
                key: ValueKey("alert_text")),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                key: ValueKey("close_fourth_button"),
                onPressed: () {
                  // Close the screen and return "Nope." as the result.
                  Navigator.pop(context, 'Nope.');
                },
                child: Text('Close'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
