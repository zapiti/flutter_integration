library secundary_microapp;

import 'package:flutter/material.dart';

class SecundaryMicroApp extends StatelessWidget {
  final int _counter;
  final Function(int) callBack;
  SecundaryMicroApp(this._counter,this.callBack);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text("Secundary Microapp"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Welcome to ExecuteAutomation " + _counter.toString(),
                key: ValueKey("secudary_value")),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                key: ValueKey("close_button"),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Close'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                key: ValueKey("next_to_third_button"),
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
