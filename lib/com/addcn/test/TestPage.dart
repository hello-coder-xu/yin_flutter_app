import 'package:flutter/material.dart';

class TestPage extends StatelessWidget {
  int number = 0;

  @override
  Widget build(BuildContext context) {
    return InheritedWidgetPage(
      number: number,
      child: new Scaffold(
        appBar: new AppBar(
          title: new Text('第一个页面'),
          centerTitle: true,
        ),
        body: Align(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("$number"),
              RaisedButton(
                child: Text("add"),
                onPressed: add,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void add() {
    number += 1;
    print('test number=$number');
  }
}

class OtherTestPage extends StatelessWidget {
  int number = 0;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('第一个页面'),
        centerTitle: true,
      ),
      body: Align(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("$number"),
            RaisedButton(
              child: Text("add"),
              onPressed: add,
            ),
          ],
        ),
      ),
    );
  }

  void add() {
    number += 1;
  }
}

class InheritedWidgetPage extends InheritedWidget {
  final int number;
  final Widget child;

  InheritedWidgetPage({this.number = 0, this.child}) : super(child: child);

  static InheritedWidgetPage of(BuildContext context) => context.inheritFromWidgetOfExactType(InheritedWidgetPage);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }
}
