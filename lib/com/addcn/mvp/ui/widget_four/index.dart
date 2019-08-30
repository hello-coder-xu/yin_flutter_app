import 'package:flutter/material.dart';
import 'package:flutter_app/com/addcn/mvp/ui/eventbus.dart';
import 'package:weui/button/index.dart';

class FourWidget extends StatefulWidget {
  @override
  FourWidgetState createState() => new FourWidgetState();
}

class FourWidgetState extends State<FourWidget> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('第四个页面'),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          WeButton(
            '切换Main的Tab',
            onClick: () {
              print('test 我点了');
              eventBus.fire(MainEvent());
            },
          ),
        ],
      ),
    );
  }
}
