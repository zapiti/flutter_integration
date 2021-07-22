import 'package:flutter/material.dart';
import 'package:fourth_microapp/fourth_microapp.dart';
import 'package:secundary_microapp/secundary_microapp.dart';
import 'package:third_microapp/third_microapp.dart';
import 'package:flutter_driver/driver_extension.dart';


void main() {
  enableFlutterDriverExtension();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: MyHomePage(title: 'ExecuteAutomation Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  void _openSecundaryPage() async {
    await Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => SecundaryMicroApp(_counter, (value) {
                setState(() {
                  _counter = value;
                });
                _openThirdPage();
              })),
    );
  }

  void _openThirdPage() async {
    await Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => ThirdMicroApp(_counter, (value) {
            setState(() {
              _counter = value;
            });
            _openFourthPage();
          })),
    );
  }

  void _openFourthPage() async {
    await Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => FourthMicroApp(_counter, (value) {
            setState(() {
              _counter = value;
            });
            _openThirdPage();
          })),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title), key: Key('app_bar')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:222',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
              key: Key("counterText"),
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                new RaisedButton(
                  key: Key("open"),
                  padding: const EdgeInsets.all(8.0),
                  textColor: Colors.white,
                  color: Colors.blue,
                  onPressed: () {
                    _openSecundaryPage();
                  },
                  child: new Text("Open Page"),
                ),
                new RaisedButton(
                  key: Key("subtract"),
                  onPressed: _decrementCounter,
                  textColor: Colors.white,
                  color: Colors.red,
                  padding: const EdgeInsets.all(8.0),
                  child: new Text(
                    "Subtract",
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',key: Key('Increment'),
        child: Icon(Icons.add),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
