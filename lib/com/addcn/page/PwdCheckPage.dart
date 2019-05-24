import 'package:flutter/material.dart';
import 'package:flutter_app/com/addcn/component/Ts.dart';

///密码检测
class PwdCheckPage extends StatefulWidget {
  @override
  PwdCheckPageState createState() => new PwdCheckPageState();
}

class PwdCheckPageState extends State<PwdCheckPage> {
  TextEditingController controller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('密码检测'),
      ),
      body: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          new TextField(
            controller: controller,
            decoration: new InputDecoration(hintText: "请输入内容"),
          ),
          new RaisedButton(
            onPressed: check,
            child: new Text('检测'),
          )
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  ///密码检测
  void check() {
    String value = controller.text;

    print("test isNumber=${isNumber(value)}");
    print("test isLetter=${isLetter(value)}");
    print("test isSymbol=${isSymbol(value)}");
  }

  ///检测数字
  bool isNumber(String value) {
    return new RegExp("[1-9]").hasMatch(value);
  }

  ///检测数字
  bool isLetter(String value) {
    return new RegExp("[A-Za-z]").hasMatch(value);
  }

  ///检测符号
  bool isSymbol(String value) {
    String patrn = "[`~!@#\$%^&*()_\-+=<>?:\"{}|,.//\/;'\\[\]·~！@#￥%……&*（）——\-+={}|《》？：“”【】、；‘’，。、]";
    for (int i = 0; i < value.length; i++) {
      if (patrn.contains(value[i])) {
        return true;
      }
    }
    return false;
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
