import 'package:flutter/material.dart';
import 'package:flutter_toast_pk/flutter_toast_pk.dart';

class MyOkToast extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyOkToast> {
  int _counter = 0;

  void _incrementCounter() {
    _counter++;
    FlutterToast.showToast("wo lai l ");
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("ktoast demo"),
      ),
      body: Stack(
        children: <Widget>[
          new Center(
            child: ListView(
              children: <Widget>[
                new Text(
                  'You have pushed the button this many times:',
                ),
                new Text(
                  '$_counter',
                  style: Theme.of(context).textTheme.display1,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RaisedButton(
                    onPressed: () {},
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RaisedButton(
                    onPressed: _incrementCounter,
                    child: Text('toast'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
