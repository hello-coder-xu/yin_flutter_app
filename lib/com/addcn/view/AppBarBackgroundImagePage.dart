import 'package:flutter/material.dart';

///appbar- 折叠
class AppBarBackgroundImagePage extends StatefulWidget {
  @override
  AppBarBackgroundImagePageState createState() => new AppBarBackgroundImagePageState();
}

class AppBarBackgroundImagePageState extends State<AppBarBackgroundImagePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('test', style: new TextStyle(color: Colors.red)),
        flexibleSpace: Container(
          decoration: new BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                "https://cp2.100.com.tw/service/active/2019/02/15/155021601801413807_1500x1040xscale1xsid9276.jpg?webp=1&v=3",
              ),
              fit: BoxFit.none,
            ),
          ),
        ),
        iconTheme: IconThemeData(color: Colors.red),
      ),
    );
  }
}
