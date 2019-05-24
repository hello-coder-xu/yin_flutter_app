import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';

class MyLifeCycleTwo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new LifeCycleState();
  }
}

class LifeCycleState extends State<MyLifeCycleTwo> {
  int index = 0;

  //构造函数
  LifeCycleState() {
    LogUtil.init(isDebug: true, tag: "MyLifeCycleTwo生命周期");
    LogUtil.v("LifeCycleState", tag: "MyLifeCycleTwo生命周期");
  }

  //状态初始化
  @override
  void initState() {
    super.initState();
    LogUtil.v("initState", tag: "MyLifeCycleTwo生命周期");
  }

  //更新依赖关系
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    LogUtil.v("didChangeDependencies", tag: "MyLifeCycleTwo生命周期");
  }

  //点击事件
  void floatButtonClick() {
    LogUtil.v("floatButtonClick", tag: "MyLifeCycleTwo生命周期");
    setState(() {
      index = index + 1;
    });
  }

  //下一个页面
  void nextPage(BuildContext context) {
    Navigator.pop(context);
  }

  //构建
  @override
  Widget build(BuildContext context) {
    LogUtil.v("build", tag: "MyLifeCycleTwo生命周期");
    return new MaterialApp(
      title: 'MyLifeCycleTwo生命周期',
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('MyLifeCycleTwo生命周期'),
        ),
        body: getBody(),
        floatingActionButton: new FloatingActionButton(
          onPressed: floatButtonClick,
          child: new Text('点击'),
        ),
      ),
    );
  }

  //更新Widget
  @override
  void didUpdateWidget(MyLifeCycleTwo oldWidget) {
    LogUtil.v("didUpdateWidget", tag: "MyLifeCycleTwo生命周期");
    super.didUpdateWidget(oldWidget);
  }

  //销毁
  @override
  void dispose() {
    super.dispose();
    LogUtil.v("dispose", tag: "MyLifeCycleTwo生命周期");
  }

  //获取显示体
  Widget getBody() {
    return new Center(
      child: new Column(
        children: <Widget>[
          new Padding(
            padding: EdgeInsets.all(30),
            child: new Text("点击次数是：$index"),
          ),
          new Padding(
            padding: EdgeInsets.all(30),
            child: new RaisedButton(
              child: new Text('返回'),
              onPressed: () => nextPage(context),
            ),
          ),
        ],
      ),
    );
  }
}
