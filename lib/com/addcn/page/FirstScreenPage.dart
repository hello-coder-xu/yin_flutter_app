import 'package:flutter/material.dart';
import 'package:flutter_app/com/addcn/page/ScondeScreenPage.dart';


class FirstScreenPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: '页面跳转',
      home: new FirstScreen(),
    );
  }
}

class FirstScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FirstScreenState();
  }
}

class FirstScreenState extends State<FirstScreen> {
  String value="我在等待数据...";

  @override
  void initState() {
    super.initState();

  }

  //页面动画
  static SlideTransition createTransition(
      Animation<double> animation, Widget child) {
    return new SlideTransition(
      position: new Tween<Offset>(
        begin: const Offset(1.0, 0.0),
        end: const Offset(0.0, 0.0),
      ).animate(animation),
      child: child,
    );
  }

  void nextPage(BuildContext context) {
    Navigator.push<String>(
        context,
        new PageRouteBuilder(pageBuilder: (BuildContext context,
            Animation<double> animation, Animation<double> secondaryAnimation) {
          // 跳转的路由对象
          return new SecondScreen(
            value: '我过去了',
          );
        }, transitionsBuilder: (
          BuildContext context,
          Animation<double> animation,
          Animation<double> secondaryAnimation,
          Widget child,
        ) {
          return createTransition(animation, child);
        }));

//           ne
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('第一个页面'),
          backgroundColor: Colors.red,
        ),
        body: new Center(
          child: new Padding(
            padding: EdgeInsets.all(30),
            child: new Column(
              children: <Widget>[
                new Text(
                  value,
                  style: new TextStyle(fontSize: 30),
                ),
                new Padding(
                  padding:
                      EdgeInsets.only(left: 0, top: 20, right: 0, bottom: 0),
                  child: new RaisedButton(
                    onPressed: () => nextPage(context),
                    child: new Text('跳转'),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
