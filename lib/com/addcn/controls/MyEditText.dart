
import 'package:flutter/material.dart';
import 'package:yin_utils/yin_utils.dart';

//输入框
class MyEditText extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return EditTextBody();
  }
}

class EditTextBody extends State<MyEditText> {
  TextEditingController _controller = new TextEditingController.fromValue(new TextEditingValue(text: "显示内容"));
  TextEditingController cur;

  @override
  void initState() {
    super.initState();
  }

  editChange(String str) {
    print("我变成：" + str);
  }

  Widget testItem() {
    return new Container(
      height: 50,
      child: new Row(
        children: <Widget>[
          new Expanded(child: new Text('身份证号')),
          new Expanded(
            child: new Container(
              child: new Row(
                children: <Widget>[
                  new Expanded(
                    child: new Container(
                      child: new TextField(
                        decoration: new InputDecoration(
                          hintText: "请输入身份证号",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  new Expanded(
                    child: new Container(
                      child: new TextField(
                        decoration: new InputDecoration(
                          hintText: "括号内容",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            flex: 3,
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('EditText控件'),
      ),
      body: new CustomScrollView(
        slivers: <Widget>[
          new SliverPadding(
            padding: EdgeInsets.all(0),
            sliver: new SliverList(
              delegate: new SliverChildListDelegate(
                <Widget>[
                  new Container(
                    color: Colors.white,
                    width: ScreenUtil.getInstance().screenWidth,
                    height: 60,
                    margin: EdgeInsets.all(10),
                    child: new Row(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        new Container(
                          height: 60,
                          width: (ScreenUtil.getInstance().screenWidth - 2 * 20 - 60) / 2,
                          child: new TextField(
                            textAlign: TextAlign.center,
                            autofocus: false,
                            decoration: new InputDecoration(
                              hintText: '最低價',
                              hintStyle: new TextStyle(color: Color(0xFF333333)),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                borderSide: BorderSide(
                                  color: Color(0xFFf6f6f6),
                                  width: 0.5,
                                ),
                              ),
                              contentPadding: EdgeInsets.all(10.0),
                              fillColor: Color(0xFFf6f6f6),
                              filled: true,
                              enabledBorder: new OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                borderSide: BorderSide(
                                  color: Color(0xFFf6f6f6),
                                  width: 0.5,
                                ),
                              ),
                            ),
                          ),
                        ),
                        new Container(
                          height: 50,
                          width: 60,
                          child: new Text(
                            "—",
                            style: new TextStyle(fontSize: 18, color: Colors.deepOrange),
                          ),
                          alignment: Alignment.center,
                        ),
                      ],
                    ),
                  ),
                  new TextField(
                    decoration: new InputDecoration(
                      hintText: '我是默认内容',
                    ),
                    obscureText: false,
                    textAlign: TextAlign.center,
                    controller: _controller,
                    onChanged: editChange,
                  ),
                  new RaisedButton(
                    onPressed: log,
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
                  testItem(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  log() {

  }
}

class TextEdit extends StatefulWidget {
  final Function callBack;

  TextEdit(this.callBack);

  @override
  TextEditState createState() => new TextEditState();
}

class TextEditState extends State<TextEdit> {
  TextEditingController controller = new TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    return new Material(
      child: new TextField(
        decoration: new InputDecoration(hintText: '测试输入'),
        controller: controller,
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    if (widget.callBack != null) {
      widget.callBack(controller);
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
