import 'package:flutter/material.dart';
import 'package:flutter_app/com/addcn/comm/Config.dart';

class TextDialogPage extends StatefulWidget {
  @override
  TextDialogPageState createState() => new TextDialogPageState();
}

class TextDialogPageState extends State<TextDialogPage> {
  int index = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 400,
      width: Config.width,
      color: Colors.white,
      alignment: Alignment.center,
      child: new RaisedButton(
        onPressed: changeValue,
        child: new Text("确定$index"),
        color: Colors.green,
        textColor: Colors.white,
      ),
    );
  }

  void changeValue() {
    setState(() {
      index += 1;
    });
  }
}
