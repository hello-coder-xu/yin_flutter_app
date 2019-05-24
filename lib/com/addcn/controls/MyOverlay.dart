import 'package:yin_utils/yin_utils.dart';
import 'package:flutter/material.dart';

double HEIGTH = ScreenUtil.getInstance().screenHeight;
double WIDTH = ScreenUtil.getInstance().screenWidth;



class MyOverlay extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyOverlay> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("popwindow"),
      ),
      body: new Center(
        child: new RaisedButton(
          onPressed: () {
            Toast.show(context: context, message: "显示对话框");
          },
          child: new Text("点击显示overlay"),
        ),
      ),
    );
  }
}

//利用overlay实现Toast
class Toast {
  static void show({@required BuildContext context, @required String message}) {
    //创建一个OverlayEntry对象
    OverlayEntry overlayEntry = new OverlayEntry(builder: (context) {
      return new Positioned(
          top: MediaQuery.of(context).size.height * 0.7,
          child: new Material(
            child: new Container(
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.center,
              child: new Center(
                child: new Card(
                  child: new Padding(
                    padding: EdgeInsets.all(8),
                    child: new Text(message),
                  ),
                  color: Colors.grey,
                ),
              ),
            ),
          ));
    });
    //往Overlay中插入插入OverlayEntry
    Overlay.of(context).insert(overlayEntry);
    new Future.delayed(Duration(seconds: 2)).then((value) {
      overlayEntry.remove();
    });
  }
}
