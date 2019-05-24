import 'package:yin_utils/yin_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/com/addcn/component/BsheetView.dart';
import 'package:flutter_app/com/addcn/component/BsheetView2.dart';

class BottomMainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.red, backgroundColor: Colors.white),
      home: BottomBody(),
    );
  }
}

class BottomBody extends StatefulWidget {
  @override
  BottomMainPageState createState() => new BottomMainPageState();
}

class BottomMainPageState extends State<BottomBody> {
  bool display = false;
  double width = ScreenUtil.getInstance().screenWidth;
  double height = ScreenUtil.getInstance().screenHeight;
  BsheetView bsheetView;

  int index = 0;

  ///点击事件
  void click() {
    setState(() {
      display = !display;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new MyBottomSheet(
      content: new Scaffold(
        appBar: new AppBar(
          title: new Text('底部bottomsheet'),
        ),
        body: new Container(
          height: 300,
          color: Colors.blue,
        ),
        floatingActionButton: new FloatingActionButton(
          onPressed: click,
          child: new Icon(Icons.add),
        ),
      ),
      bottomView: new Container(
        height: 300,
        color: Colors.red,
      ),
      display: display,
      callBack: () {
        setState(() {
          display = !display;
        });
      },
    );
  }
}
