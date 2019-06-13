import 'package:flutter/material.dart';
import 'package:flutter_app/com/addcn/bean/PageBean.dart';
import 'package:flutter_app/com/addcn/view/DeviceInfoPage.dart';
import 'package:flutter_app/com/addcn/view/EmojiPage.dart';
import 'package:flutter_app/com/addcn/view/RxDartPage.dart';
import 'package:flutter_app/com/addcn/view/ScopedModelPage.dart';
import 'package:flutter_app/com/addcn/view/StateManagePage.dart';
import 'package:flutter_app/com/addcn/view/StreamPage.dart';
import 'package:flutter_app/com/addcn/view/TipPage.dart';

///其他视图
class OtherPage extends StatefulWidget {
  @override
  OtherPageState createState() => new OtherPageState();
}

class OtherPageState extends State<OtherPage> {
  List<PageBean> items = [
    PageBean("主题", "Theme", null),
    PageBean("对话框", "Dialog", null),
    PageBean("提示", "Toast/snack", TipPage()),
    PageBean("动画", "Animation", null),
    PageBean("通知", "Notification", null),
    PageBean("表情包", "emoji", EmojiPage()),
    PageBean("设备信息", "DeviceInfo", DeviceInfoPage()),
    PageBean("数据监听", "Stream", StreamPage()),
    PageBean("状态管理", "InheritedWidget", StateManagePage()),
    PageBean("状态管理", "ScopedModelPage", ScopedModelPage()),
    PageBean("响应式编程", "RxDart", RxDartPage()),
  ];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: ListView.separated(
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(items[index].name),
            subtitle: Text(items[index].subName),
            trailing: new Icon(Icons.keyboard_arrow_right),
            onTap: () => onItemClick(index),
          );
        },
        separatorBuilder: (index, context) {
          return Divider(color: Colors.grey, height: 1);
        },
        itemCount: items.length,
      ),
    );
  }

  ///item 点击
  void onItemClick(int index) {
    if (items[index].page == null) return;
    Navigator.push(
      context,
      new MaterialPageRoute(builder: (context) => items[index].page),
    );
  }
}
