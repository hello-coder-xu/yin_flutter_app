import 'package:flutter/material.dart';
import 'package:flutter_app/com/addcn/view/AppBarBasePage.dart';
import 'package:flutter_app/com/addcn/view/AppBarBackgroundImagePage.dart';
import 'package:flutter_app/com/addcn/view/AppBarTabPage.dart';
import 'package:flutter_app/com/addcn/view/SliverAppBarPage.dart';
import 'dart:math';

///标题栏
class AppBarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('appBar视图'),
        centerTitle: true,
      ),
      body: Align(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: new Text('appBar基础', style: new TextStyle(color: Colors.white)),
              color:
                  Color.fromARGB(100, new Random().nextInt(255), new Random().nextInt(255), new Random().nextInt(255)),
              onPressed: () {
                Navigator.push(context, new MaterialPageRoute(builder: (context) => new AppBarBasePage()));
              },
            ),
            RaisedButton(
              child: new Text('appBar加背景', style: new TextStyle(color: Colors.white)),
              color:
              Color.fromARGB(100, new Random().nextInt(255), new Random().nextInt(255), new Random().nextInt(255)),
              onPressed: () {
                Navigator.push(context, new MaterialPageRoute(builder: (context) => new AppBarBackgroundImagePage()));
              },
            ),

            RaisedButton(
              child: new Text('appBar的Tab功能', style: new TextStyle(color: Colors.white)),
              color:
                  Color.fromARGB(100, new Random().nextInt(255), new Random().nextInt(255), new Random().nextInt(255)),
              onPressed: () {
                Navigator.push(context, new MaterialPageRoute(builder: (context) => new AppBarTabPage()));
              },
            ),
            RaisedButton(
              child: new Text('相似功能(SliverAppBar)', style: new TextStyle(color: Colors.white)),
              color:
                  Color.fromARGB(100, new Random().nextInt(255), new Random().nextInt(255), new Random().nextInt(255)),
              onPressed: () {
                Navigator.push(context, new MaterialPageRoute(builder: (context) => new SliverAppBarPage()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
