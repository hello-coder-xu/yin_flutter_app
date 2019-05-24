import 'package:flutter/material.dart';

//线性布局
class MyLinearLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("LinearLayout"),
      ),
      body: new CustomScrollView(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        slivers: <Widget>[
          new SliverPadding(
            padding: const EdgeInsets.all(20.0),
            sliver: new SliverList(
                delegate: new SliverChildListDelegate(<Widget>[
              const Text('A'),
              const Text('B'),
              const Text('C'),
              const Text('D'),
              const Text('E'),
              const Text('F'),
              const Text('G'),
              const Text('H'),
              const Text('I'),
              const Text('J'),
              const Text('K'),
              const Text('L'),
              const Text('M'),
              const Text('N'),
              const Text('O'),
              const Text('P'),
              const Text('Q'),
              const Text('R'),
              const Text('S'),
              const Text('T'),
              const Text('U'),
            ])),
          )
        ],
      ),
    );
  }
}

class LinearLayoutBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
        color: Colors.blue,
        alignment: Alignment.center,
        child: new Column(
          children: <Widget>[
            new RaisedButton(
              onPressed: () {
                print('点击红色按钮事件');
              },
              color: const Color(0xffcc0000),
              child: new Text('红色按钮'),
            ),
            new RaisedButton(
              onPressed: () {
                print('点击黄色按钮');
              },
              color: const Color(0xfff1c232),
              child: new Text(
                '黄色按钮',
                style: new TextStyle(color: Colors.white),
              ),
            ),
            new RaisedButton(
              onPressed: () {
                print('点击粉色按钮事件');
              },
              color: const Color(0xffea9999),
              child: new Text('粉色按钮'),
            ),
          ],
        ));
  }
}
