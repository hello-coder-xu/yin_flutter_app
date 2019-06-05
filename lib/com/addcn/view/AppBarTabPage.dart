import 'package:flutter/material.dart';

///其他使用
class AppBarTabPage extends StatefulWidget {
  @override
  AppBarTabPageState createState() => new AppBarTabPageState();
}

class AppBarTabPageState extends State<AppBarTabPage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('其他使用'),
        centerTitle: true,
        bottom: TabBar(
          tabs: [
            Tab(icon: Icon(Icons.cake), text: '左侧'),
            Tab(icon: Icon(Icons.golf_course), text: '右侧'),
          ],
          controller: TabController(length: 2, vsync: this),
        ),
      ),
    );
  }
}
