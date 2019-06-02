import 'package:flutter/material.dart';

///分割线
class DividerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text('分割线'),
        centerTitle: true,
      ),
      body: Align(
        child: new Column(
          children: <Widget>[
            new ListTile(title: new Text('红色、高度为1的分割线')),
            Divider(color: Colors.red, height: 1),
            new ListTile(title: new Text('左边缩进的分割线')),
            Divider(
              color: Colors.red,
              height: 1,
              indent: 20,
            ),
          ],
        ),
      ),
    );
  }
}
