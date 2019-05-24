import 'package:flutter/material.dart';
import 'package:common_utils/common_utils.dart';
import 'package:yin_utils/yin_utils.dart';

class MySpUtil extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ButtonBody();
  }
}

//垂直布局
class ButtonBody extends State<MySpUtil> {
  var data;
  int index = 10;
  var btnValue;
  TimerUtil timerUtil;
  TimerUtil coutDownUtil;
  var numberValue;
  String screen;

  void countDown() {

    LogUtil.e("...log...", tag: "test");


    if (btnValue == "倒计时") {
      index = 10;
      coutDownUtil = new TimerUtil(mInterval: 1000, mTotalTime: 10000);
      coutDownUtil.setOnTimerTickCallback((int value) {
        setState(() {
          btnValue = index == 0 ? "倒计时" : "${index--} s";
        });
      });
      coutDownUtil.startCountDown();
    }
  }

  void storage() async {
    await SpUtil.getInstance();
    SpUtil.putString("mykey", "我存了100w");
  }

  void read() {
    var value = SpUtil.getString("mykey",defValue: "我啥都没取到");
    LogUtil.v(value, tag: "test");
  }

  @override
  void initState() {
    super.initState();
    data = DateUtil.getNowDateStr();


    LogUtil.init(isDebug: true, tag: "test");

    timerUtil = new TimerUtil(mInterval: 1000);
    timerUtil.setOnTimerTickCallback((int value) {
      setState(() {
        data = DateUtil.getNowDateStr();
      });
    });
    timerUtil.startTimer();

    numberValue = NumUtil.getNumByValueDouble(3.1415926933, 3);

    btnValue = "倒计时";

    screen = "屏幕宽：\n${ScreenUtil.getInstance().screenWidth}"
        "\n屏幕高:\n${ScreenUtil.getInstance().screenHeight}"
        "\nappbar高：\n${ScreenUtil.getInstance().appBarHeight}";
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme:
          ThemeData(primarySwatch: Colors.red, backgroundColor: Colors.white),
      home: new Scaffold(
          appBar: new AppBar(
            leading: new IconButton(
              icon: new Icon(Icons.menu),
              tooltip: '抽屉栏',
              onPressed: null,
            ),
            title: new Text('Button控件'),
            actions: <Widget>[
              new IconButton(icon: new Icon(Icons.search), onPressed: null)
            ],
          ),
          body: new Center(
            child: new Padding(
              padding: EdgeInsets.all(30),
              child: new Column(
                children: <Widget>[
                  new Text(
                    data,
                    style: new TextStyle(fontSize: 26),
                  ),
                  new Text(
                    screen,
                    style: new TextStyle(fontSize: 26),
                  ),
                  new Text(
                    "保留2位小数：$numberValue",
                    style: new TextStyle(fontSize: 26),
                  ),
                  new RaisedButton(
                    onPressed: countDown,
                    child: Text(
                      btnValue,
                      style: new TextStyle(fontSize: 16),
                    ),
                    padding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                    textColor: Colors.white,
                    textTheme: ButtonTextTheme.normal,
                    color: Colors.green,
                    highlightColor: Colors.green,
                    splashColor: Colors.red,
                    clipBehavior: Clip.antiAlias,
                  ),
                  new RaisedButton(
                    onPressed: storage,
                    child: Text(
                      '存储',
                      style: new TextStyle(fontSize: 16),
                    ),
                    padding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                    textColor: Colors.white,
                    textTheme: ButtonTextTheme.normal,
                    color: Colors.green,
                    highlightColor: Colors.green,
                    splashColor: Colors.red,
                    clipBehavior: Clip.antiAlias,
                  ),
                  new RaisedButton(
                    onPressed: read,
                    child: Text(
                      '读取',
                      style: new TextStyle(fontSize: 16),
                    ),
                    padding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                    textColor: Colors.white,
                    textTheme: ButtonTextTheme.normal,
                    color: Colors.green,
                    highlightColor: Colors.green,
                    splashColor: Colors.red,
                    clipBehavior: Clip.antiAlias,
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
