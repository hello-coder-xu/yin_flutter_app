import 'package:flutter/material.dart';

log() {
  print('点击按钮了');
}

//垂直布局
class MyButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('Button控件'),
          actions: <Widget>[
            new IconButton(icon: new Icon(Icons.search), onPressed: null)
          ],
        ),
        body: new Center(
          child: new Column(
            children: <Widget>[
              new FloatingActionButton(
                onPressed: log,
                child: Text(
                  '圆',
                  style: new TextStyle(fontSize: 16),
                ),
              ),
              new RaisedButton(
                onPressed: log,
                child: Text(
                  'RaisedButton',
                  style: new TextStyle(fontSize: 16),
                ),
                padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                textColor: Colors.white,
                textTheme: ButtonTextTheme.normal,
                color: Colors.green,
                highlightColor: Colors.green,
                splashColor: Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                  side: BorderSide(
                      color: Colors.red, style: BorderStyle.solid, width: 1),
                ),
                clipBehavior: Clip.antiAlias,
              ),
              new FlatButton(
                onPressed: log,
                child: new Text('FlatButton'),
                padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                textColor: Colors.white,
                textTheme: ButtonTextTheme.normal,
                color: Colors.green,
                highlightColor: Colors.green,
                colorBrightness: Brightness.light,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.zero,
                    bottomLeft: Radius.zero,
                    bottomRight: Radius.circular(10),
                  ),
                  side: BorderSide(
                      color: Colors.red, style: BorderStyle.solid, width: 1),
                ),
                clipBehavior: Clip.antiAlias,
              ),
              new OutlineButton(
                onPressed: log,
                child: new Text('FlatButton'),
                padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                textColor: Colors.green,
                textTheme: ButtonTextTheme.normal,
                color: Colors.green,
                highlightColor: Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.zero,
                    bottomLeft: Radius.zero,
                    bottomRight: Radius.circular(10),
                  ),
                  side: BorderSide(
                      color: Colors.red, style: BorderStyle.solid, width: 1),
                ),
                clipBehavior: Clip.antiAlias,
              ),
              new OutlineButton.icon(
                onPressed: log,
                icon: new Icon(Icons.home),
                label: new Text('FlatButton.icon'),
                padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                textColor: Colors.green,
                textTheme: ButtonTextTheme.normal,
                color: Colors.green,
                highlightColor: Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.zero,
                    bottomLeft: Radius.zero,
                    bottomRight: Radius.circular(10),
                  ),
                  side: BorderSide(
                      color: Colors.red, style: BorderStyle.solid, width: 1),
                ),
                clipBehavior: Clip.antiAlias,
              ),
              new IconButton(
                icon: new Icon(Icons.home),
                onPressed: log,
                padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                color: Colors.green,
                highlightColor: Colors.red,
              ),
            ],
          ),
        ));
  }
}
