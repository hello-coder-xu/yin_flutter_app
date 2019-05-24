import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/com/addcn/page/MyLifeCycleTwo.dart';

//生命周期
class MyLifeCycle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: '',
      home: new MyLifeCycleBody(),
    );
  }
}

class MyLifeCycleBody extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new LifeCycleState();
  }
}

class LifeCycleState extends State<MyLifeCycleBody> {
  int index = 0;

  //构造函数
  LifeCycleState() {
    LogUtil.init(isDebug: true, tag: "MyLifeCycle生命周期");
    LogUtil.v("LifeCycleState", tag: "MyLifeCycle生命周期");
  }

  //状态初始化
  @override
  void initState() {
    super.initState();
    LogUtil.v("initState", tag: "MyLifeCycle生命周期");
  }

  //更新依赖关系
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    LogUtil.v("didChangeDependencies", tag: "MyLifeCycle生命周期");
  }

  //点击事件
  void floatButtonClick() {
    LogUtil.v("floatButtonClick", tag: "MyLifeCycle生命周期");
    setState(() {
      index = index + 1;
    });
  }

  //下一个页面
  void nextPage(BuildContext context) {
    Navigator.push(
      context,
      new MaterialPageRoute(
        builder: (context) => new MyLifeCycleTwo(),
      ),
    ).then((value) {
      print("test $value");
    });
  }

  //构建
  @override
  Widget build(BuildContext context) {
    LogUtil.v("build", tag: "MyLifeCycle生命周期");
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('MyLifeCycle生命周期'),
      ),
      body: new Center(
        child: new Column(
          children: <Widget>[
            new Padding(
              padding: EdgeInsets.all(30),
              child: new Text("点击次数是：$index"),
            ),
            new Padding(
              padding: EdgeInsets.all(30),
              child: new RaisedButton(
                child: new Text('下一个页面'),
                onPressed: () => nextPage(context),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: floatButtonClick,
        child: new Text('点击'),
      ),
    );
  }

  //更新Widget
  @override
  void didUpdateWidget(MyLifeCycleBody oldWidget) {
    super.didUpdateWidget(oldWidget);
    LogUtil.v("didUpdateWidget", tag: "MyLifeCycle生命周期");
  }

  //销毁
  @override
  void dispose() {
    super.dispose();
    LogUtil.v("dispose", tag: "MyLifeCycle生命周期");
  }
}
