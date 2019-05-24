import 'package:flutter/material.dart';
import 'package:flutter_app/com/addcn/component/LoadingDialog.dart';
import 'package:flutter_app/com/addcn/page/DialogBase.dart';
import 'package:flutter_app/com/addcn/page/PayPwd.dart';

///对话框

class MyDialog extends StatefulWidget {
  @override
  MyDialogState createState() => new MyDialogState();
}

class MyDialogState extends State<MyDialog> {
  final TextEditingController editController = new TextEditingController();
  String value = "我是用来显示的";

  displayDialog(int index) {
    switch (index) {
      case 1:
        showDialog(
            context: context,
            builder: (_) => new SimpleDialog(
                  title: new Text('简单对话框标题'),
                  children: <Widget>[
                    new SimpleDialogOption(
                      child: new Text('选项1'),
                      onPressed: () {

                        Navigator.of(context).pop();
                      },
                    ),
                    new SimpleDialogOption(
                      child: new Text('选项2'),
                      onPressed: () {

                        Navigator.of(context).pop();
                      },
                    )
                  ],
                ));
        break;
      case 2:
        showDialog(
            context: context,
            barrierDismissible: true,
            builder: (_) => new AlertDialog(
                  title: Text('标题'),
                  content: new Text('我要显示内容，啊哈哈哈'),
                  backgroundColor: Colors.green,
                  actions: <Widget>[
                    new FlatButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: new Text('取消'),
                    ),
                    new FlatButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: new Text('确定'),
                    )
                  ],
                ));

        break;
      case 3:
        showDialog(
            context: context,
            barrierDismissible: true,
            builder: (_) => new AlertDialog(
                  title: Text('标题'),
                  content: new TextField(
                    controller: editController,
                    onChanged: (str) {
                      setState(() {
                        value = str;
                      });
                    },
                  ),
                  actions: <Widget>[
                    new FlatButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: new Text('确定'),
                    )
                  ],
                ));
        break;
      case 4:
        showDialog(
          context: context,
          builder: (_) => new LoadingDialog(text: '加载中'),
        );
        break;
      case 5:
        showDialog(
            context: context,
            barrierDismissible: true,
            builder: (_) => new AlertDialog(
                  title: Text('标题'),
                  content: new Text('我要显示内容，啊哈哈哈'),
                  actions: <Widget>[
                    new FlatButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: new Text('取消'),
                    ),
                    new FlatButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: new Text('确定'),
                    )
                  ],
                ));
        break;
      case 6:
        showDialog(
            context: context,
            builder: (context) => new DialogBase(new PayPwd()));
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('对话框'),
      ),
      body: new Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          new RaisedButton(
            onPressed: () {
              displayDialog(1);
            },
            child: new Text('SimpleDialog'),
            textColor: Colors.white,
            textTheme: ButtonTextTheme.normal,
            color: Colors.green,
            highlightColor: Colors.green,
          ),
          new RaisedButton(
            onPressed: () {
              displayDialog(2);
            },
            child: new Text('AlertDialog'),
            textColor: Colors.white,
            textTheme: ButtonTextTheme.normal,
            color: Colors.green,
            highlightColor: Colors.green,
          ),
          new RaisedButton(
            onPressed: () {
              displayDialog(3);
            },
            child: new Text('输入对话框'),
            textColor: Colors.white,
            textTheme: ButtonTextTheme.normal,
            color: Colors.green,
            highlightColor: Colors.green,
          ),
          new RaisedButton(
            onPressed: () {
              displayDialog(4);
            },
            child: new Text('加载对话框'),
            textColor: Colors.white,
            textTheme: ButtonTextTheme.normal,
            color: Colors.green,
            highlightColor: Colors.green,
          ),
          new RaisedButton(
            onPressed: () {
              displayDialog(5);
            },
            child: new Text('底部对话框'),
            textColor: Colors.white,
            textTheme: ButtonTextTheme.normal,
            color: Colors.green,
            highlightColor: Colors.green,
          ),
          new RaisedButton(
            onPressed: () {
              displayDialog(6);
            },
            child: new Text('自定义对话框'),
            textColor: Colors.white,
            textTheme: ButtonTextTheme.normal,
            color: Colors.green,
            highlightColor: Colors.green,
          ),
          new TextField(
            decoration: new InputDecoration(
              hintText: "點擊輸入支付密碼",
              fillColor: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
