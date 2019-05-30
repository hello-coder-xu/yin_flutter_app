import 'package:flutter/material.dart';
import 'package:yin_utils/yin_utils.dart';

///提示视图
class TipPage extends StatefulWidget {
  @override
  TipPageState createState() => new TipPageState();
}

class TipPageState extends State<TipPage> {
  var _scaffoldkey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: _scaffoldkey,
      appBar: new AppBar(
        title: new Text('提示'),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.center,
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new ListTile(title: new Text('Toast')),
            new RaisedButton(
              onPressed: () {
                TsUtil.showShort(value: "我是Toast");
              },
              color: Colors.green,
              child: new Text('Toast', style: new TextStyle(color: Colors.white)),
            ),
            new ListTile(
              title: new Text('Snack 方式1'),
              subtitle: new Text('snackbar 使用时需要放在Builder 中'),
            ),
            Builder(
              builder: (context) {
                return new RaisedButton(
                  onPressed: () {
                    final snackBar = new SnackBar(
                      content: new Text('Snack 方式1'),
                      backgroundColor: Colors.red, //背景颜色
                      duration: Duration(seconds: 3), //3秒后消失
                      action: new SnackBarAction(
                        label: "点我",
                        textColor: Colors.white,
                        onPressed: () {
                          TsUtil.showShort(value: "点我干啥");
                        },
                      ),
                    );
                    Scaffold.of(context).showSnackBar(snackBar);
                  },
                  color: Colors.green,
                  child: new Text('Snack', style: new TextStyle(color: Colors.white)),
                );
              },
            ),
            new ListTile(
              title: new Text('Snack 方式2'),
              subtitle: new Text('使用GlobalKey来显示'),
            ),
            new RaisedButton(
              onPressed: () {
                final snackBar = new SnackBar(
                  content: new Text('Snack 方式2'),
                  backgroundColor: Colors.red, //背景颜色
                  duration: Duration(seconds: 3), //3秒后消失
                  action: new SnackBarAction(
                    label: "点我",
                    textColor: Colors.white,
                    onPressed: () {
                      TsUtil.showShort(value: "点我干啥");
                    },
                  ),
                );
                _scaffoldkey.currentState.showSnackBar(snackBar);
              },
              color: Colors.green,
              child: new Text('Snack', style: new TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
