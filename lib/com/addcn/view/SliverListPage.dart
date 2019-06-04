import 'package:flutter/material.dart';
import 'dart:math';

///SliverList视图
class SliverListPage extends StatelessWidget {
  ///子部件
  Widget getItemView() {
    return Container(
      height: 100,
      margin: EdgeInsets.only(bottom: 10),
      color: Color.fromARGB(100, new Random().nextInt(255), new Random().nextInt(255), new Random().nextInt(255)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('SliverList视图'),
        centerTitle: true,
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          new SliverList(
            delegate: new SliverChildListDelegate(
              <Widget>[
                getItemView(),
                getItemView(),
                getItemView(),
                getItemView(),
                getItemView(),
                getItemView(),
                getItemView(),
                getItemView(),
                getItemView(),
                getItemView(),
                getItemView(),
                getItemView(),
                getItemView(),
                getItemView(),
                getItemView(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}