import 'package:flutter/material.dart';

///列表视图
class ListViewPage extends StatefulWidget {
  @override
  ListViewPageState createState() => new ListViewPageState();
}

class ListViewPageState extends State<ListViewPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('列表视图'),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }
}
