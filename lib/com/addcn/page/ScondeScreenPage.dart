import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  final String value;

  SecondScreen({Key key, @required this.value}) : super(key: key);

  void upFirstPageValue(BuildContext context) {
    Navigator.of(context).pop('我回来啦');
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('第二个页面'),
          backgroundColor: Colors.brown,
        ),
        body: new Center(
          child: new Padding(
            padding: EdgeInsets.all(30),
            child: new Column(
              children: <Widget>[
                new Text(
                  value,
                  style: new TextStyle(fontSize: 30),
                ),
                new Padding(
                  padding: EdgeInsets.only(left: 0, top: 20, right: 0, bottom: 0),
                  child: new RaisedButton(
                    onPressed: () {
                      upFirstPageValue(context);
                    },
                    child: new Text('返回'),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
