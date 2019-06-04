import 'package:flutter/material.dart';
import 'dart:math';


///SliverGrid视图
class SliverGridPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('SliverGridPage视图'),
        centerTitle: true,
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,//一行显示2个
              crossAxisSpacing: 5.0,//列间距
              mainAxisSpacing: 5.0,//行间距
              childAspectRatio: 1.0,//内容显示比例 1.0=宽/高
            ),
            delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                return Container(
                  margin: EdgeInsets.only(bottom: 10),
                  color: Color.fromARGB(
                    100,
                    new Random().nextInt(255),
                    new Random().nextInt(255),
                    new Random().nextInt(255),
                  ),
                );
              },
              childCount: 60,
            ),
          ),
        ],
      ),
    );
  }
}