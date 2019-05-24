import 'package:yin_utils/yin_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/com/addcn/component/Toast.dart';

double HEIGTH = ScreenUtil.getInstance().screenHeight;
double WIDTH = ScreenUtil.getInstance().screenWidth;

///动画

class MyAnimations extends StatefulWidget {
  _LogoAppState createState() => new _LogoAppState();
}

class _LogoAppState extends State<MyAnimations> with SingleTickerProviderStateMixin {
  Animation<double> animation;
  Animation<double> curOpacity;
  AnimationController controller;
  bool forward = true;
  double curLeft = WIDTH;

  initState() {
    super.initState();
    controller = new AnimationController(duration: const Duration(milliseconds: 300), vsync: this);
    animation = new Tween(begin: 0.0, end: 300.0).animate(controller);
    curOpacity = new Tween<double>(begin: 0.0, end: 0.4).animate(controller);
  }

  Widget build(BuildContext context) {
    print("test animation:${animation.value}");
    print("test animation:${curOpacity.value}");

    return new Scaffold(
      appBar: new AppBar(
        title: new Text('动画'),
      ),
      body: new Container(
        height: HEIGTH,
        color: Colors.green,
        child: new Stack(
          children: <Widget>[
            new GestureDetector(
              onTap: () {
                Toast.showShort(context: context, message: "image");
              },
              child: new Image.network('https://upload.debug.100.com.tw/banner/1548225189.jpg'),
            ),
            getBottomView(new Center(
              child: new Text(
                '我是内容',
                style: new TextStyle(
                  color: Colors.white,
                ),
              ),
            )),
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: () {
          print("test btn $forward");
          if (forward) {
            curLeft = 0;
            controller.forward(); //向前播放动画
            print("test btn  11");
          } else {
            curLeft = WIDTH;
            controller.reverse(); //向后播放动画
            print("test btn  22");
          }
          forward = !forward;
        },
        tooltip: 'fade',
        child: new Icon(Icons.track_changes),
      ),
    );
  }

  //底部视图
  Widget getBottomView(Widget content) {
    return new Stack(
      children: <Widget>[
        new Positioned(
          top: 0,
          left: curLeft,
          child: new GestureDetector(
            onTap: () {
              Toast.showShort(context: context, message: "background");
            },
            child: new Opacity(
              opacity: curOpacity.value,
              child: new Container(
                height: HEIGTH,
                width: WIDTH,
                color: Colors.black,
              ),
            ),
          ),
        ),
        new Positioned(
          top: HEIGTH - animation.value,
          child: new Container(
            margin: new EdgeInsets.symmetric(vertical: 10.0),
            height: 300,
            width: WIDTH,
            color: Colors.blue,
            child: content,
          ),
        ),
      ],
    );
  }

  dispose() {
    controller.dispose();
    super.dispose();
  }
}
