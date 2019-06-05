import 'package:flutter/material.dart';
import 'package:flutter_app/com/addcn/view/NestedScrollViewPage.dart';
import 'package:flutter_app/com/addcn/view/SliverAppBarPage.dart';
import 'package:flutter_app/com/addcn/view/SliverGridPage.dart';

import 'package:flutter_app/com/addcn/view/SliverListPage.dart';

///滚动视图
class SliverPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('滚动视图'),
        centerTitle: true,
      ),
      body: Align(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              textColor: Colors.white,
              child: new Text('SliverAppBar'),
              onPressed: () {
                Navigator.push(context, new MaterialPageRoute(builder: (context) => SliverAppBarPage()));
              },
              color: Colors.red[900],
            ),
            RaisedButton(
              textColor: Colors.white,
              child: new Text('SliverList'),
              onPressed: () {
                Navigator.push(context, new MaterialPageRoute(builder: (context) => SliverListPage()));
              },
              color: Colors.red[400],
            ),
            RaisedButton(
              textColor: Colors.white,
              child: new Text('SliverGrid'),
              onPressed: () {
                Navigator.push(context, new MaterialPageRoute(builder: (context) => SliverGridPage()));
              },
              color: Colors.red[600],
            ),
          ],
        ),
      ),
    );
  }
}
