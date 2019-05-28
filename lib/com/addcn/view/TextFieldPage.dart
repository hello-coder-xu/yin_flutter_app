import 'package:flutter/material.dart';

///输入框
class TextFieldPage extends StatefulWidget {
  @override
  TextFieldPageState createState() => new TextFieldPageState();
}

class TextFieldPageState extends State<TextFieldPage> {
  TextEditingController controller = new TextEditingController(text: "hello~");
  String contentChange = "";
  String contentSubmitted = "";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('TextField视图'),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: new CustomScrollView(
          slivers: <Widget>[
            new SliverList(
              delegate: new SliverChildListDelegate(
                <Widget>[
                  new ListTile(title: new Text('输入框'), subtitle: new Text('提示')),
                  new TextField(
                    decoration: InputDecoration(hintText: "请输入内容", helperText: "我是小提示"),
                  ),
                  new ListTile(subtitle: new Text('多行显示')),
                  new TextField(
                    decoration: InputDecoration(
                      hintText: "请输入内容",
                    ),
                    maxLines: null,
                  ),
                  new ListTile(subtitle: new Text('输入密码类型')),
                  Container(
                    height: 40,
                    child: new TextField(
                      decoration: InputDecoration(
                        hintText: "请输入密码",
                      ),
                      obscureText: true,
                    ),
                  ),
                  new ListTile(subtitle: new Text('输入数字类型')),
                  Container(
                    height: 40,
                    child: new TextField(
                      decoration: InputDecoration(
                        hintText: "请输入密码",
                      ),
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.done,
                    ),
                  ),
                  new ListTile(subtitle: new Text('设置软键盘右下角按钮')),
                  Container(
                    height: 40,
                    child: new TextField(
                      decoration: InputDecoration(
                        hintText: "请输入内容",
                      ),
                      textInputAction: TextInputAction.go,
                    ),
                  ),
                  new ListTile(subtitle: new Text('加图标')),
                  Container(
                    height: 40,
                    child: new TextField(
                      decoration: InputDecoration(
                        icon: new Icon(Icons.supervisor_account),
                        prefixIcon: new Icon(Icons.arrow_left),
                        //输入框内-左边-图标
                        prefixText: '内左',
                        //输入框内-左边-文字
                        suffixIcon: new Icon(Icons.delete),
                        //输入框内-右边-图标
                        suffixText: '内右', //输入框内-右边-文字
                      ),
                    ),
                  ),
                  new ListTile(subtitle: new Text('右边删除图标+事件')),
                  Container(
                    height: 40,
                    child: new TextField(
                      decoration: InputDecoration(
                        icon: new Icon(Icons.supervisor_account),
                        //输入框内-右边-图标
                        suffix: new IconButton(
                          icon: Icon(Icons.delete, size: 15),
                          onPressed: () {
                            controller.text = "";
                          },
                        ),
                      ),
                      controller: controller,
                    ),
                  ),
                  new ListTile(subtitle: new Text('加标题')),
                  new TextField(
                    decoration: InputDecoration(
                      hintText: "请输入用户名",
                      labelText: "用户名",
                      icon: new Icon(Icons.supervisor_account),
                    ),
                    controller: controller,
                  ),
                  new ListTile(subtitle: new Text('去边框')),
                  new TextField(
                    decoration: InputDecoration(
                      hintText: "请输入用户名",
                      labelText: "用户名",
                      icon: new Icon(Icons.supervisor_account),
                      border: InputBorder.none,
                    ),
                    controller: controller,
                  ),
                  new ListTile(subtitle: new Text('加边框')),
                  new TextField(
                    decoration: InputDecoration(
                      hintText: "请输入用户名",
                      labelText: "用户名",
                      icon: new Icon(Icons.supervisor_account),
                      border: OutlineInputBorder(),
                    ),
                    controller: controller,
                  ),
                  new ListTile(subtitle: new Text('加内容背景')),
                  new TextField(
                    decoration: InputDecoration(
                      hintText: "请输入用户名",
                      labelText: "用户名",
                      icon: new Icon(Icons.supervisor_account),
                      border: OutlineInputBorder(),
                      fillColor: Colors.blue,
                      filled: true,
                    ),
                    controller: controller,
                  ),
                  new ListTile(subtitle: new Text('内容变化监听')),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: new Text(contentChange),
                  ),
                  new TextField(
                    decoration: InputDecoration(
                      hintText: "请输入用户名",
                      labelText: "用户名",
                      icon: new Icon(Icons.supervisor_account),
                      border: OutlineInputBorder(),
                      fillColor: Colors.blue,
                      filled: true,
                    ),
                    onChanged: (value) => onChange(value),
                    controller: controller,
                  ),
                  new ListTile(subtitle: new Text('内容确定监听')),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: new Text(contentSubmitted),
                  ),
                  new TextField(
                    decoration: InputDecoration(
                      hintText: "请输入用户名",
                      labelText: "用户名",
                      icon: new Icon(Icons.supervisor_account),
                      border: OutlineInputBorder(),
                      fillColor: Colors.blue,
                      filled: true,
                    ),
                    onSubmitted: (value) => onSubmitted(value),
                    controller: controller,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void onChange(String value) {
    print("我输出了$value");
    setState(() {
      contentChange = value ?? "";
    });
  }

  void onSubmitted(String value) {
    print("我输出了$value");
    setState(() {
      contentSubmitted = value ?? "";
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
