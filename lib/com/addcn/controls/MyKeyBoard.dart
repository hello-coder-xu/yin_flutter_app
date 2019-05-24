import 'package:flutter/material.dart';

//键盘控制
class MyKeyBoard extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return EditTextBody();
  }
}

class EditTextBody extends State<MyKeyBoard> {
  TextEditingController _controller;
  FocusNode focusNode = new FocusNode();

  @override
  void initState() {
    super.initState();
    _controller = new TextEditingController.fromValue(new TextEditingValue(text: "显示内容"));
  }

  log() {}

  editChange(String str) {
    print("我变成：" + str);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('EditText控件'),
      ),
      body: new Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          new TextField(
            decoration: new InputDecoration(
              hintText: '我是默认内容',
            ),
            obscureText: false,
            controller: _controller,
            focusNode: focusNode,
            onChanged: editChange,
          ),
          new RaisedButton(
            onPressed: () => focusNode.unfocus(),
            child: Text(
              '获取',
              style: new TextStyle(fontSize: 16),
            ),
            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
            textColor: Colors.white,
            textTheme: ButtonTextTheme.normal,
            color: Colors.green,
            highlightColor: Colors.green,
            splashColor: Colors.red,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(50)),
              side: BorderSide(color: Colors.red, style: BorderStyle.solid, width: 1),
            ),
            clipBehavior: Clip.antiAlias,
          ),
        ],
      ),
    );
  }
}
