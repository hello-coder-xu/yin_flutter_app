import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_app/com/addcn/test/StreamBuilder.dart';

class StatePage extends StatefulWidget {
  @override
  StatePageState createState() => new StatePageState();
}

class StatePageState extends State<StatePage> {
  StreamController streamController = new StreamController();
  int index = 0;

  @override
  Widget build(BuildContext context) {
    print('test StatePageState build');
    return Scaffold(
        appBar: AppBar(
          title: Text('statPage', style: TextStyle(fontSize: 16)),
          centerTitle: true,
        ),
        body: Align(
          child: Column(
            children: <Widget>[
              MyStreamBuilder(
                stream: streamController.stream,
                initialData: index,
                builder: (context, snapshot) {
                  print('test FutureBuilder builder snapshot.data=${snapshot.data}  index=$index');
                  return Text("this number:${snapshot.data}");
                },
              ),
              RaisedButton(
                child: Text('add $index'),
                onPressed: countChange,
              ),
              RaisedButton(
                child: Text('add2'),
                onPressed: add,
              ),
            ],
          ),
        ));
  }

  void countChange() {
    streamController.add(++index);
  }

  void add() {
    setState(() {
      index += 10;
    });
  }

  @override
  void dispose() {
    streamController.close();
    super.dispose();
  }
}
