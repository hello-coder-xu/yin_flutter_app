import 'package:flutter/material.dart';
import 'package:flutter_app/com/addcn/bean/PageBean.dart';

///其他视图
class OtherPage extends StatefulWidget {
  @override
  OtherPageState createState() => new OtherPageState();
}

class OtherPageState extends State<OtherPage> {
  List<PageBean> items = [
    PageBean("主题", "Theme", null),
    PageBean("对话框", "Dialog", null),
    PageBean("提示", "Toast/snack", null),
    PageBean("动画", "Animation", null),
    PageBean("通知", "Notification", null),
    PageBean("设备信息", "DeviceInfo", null),
    PageBean("状态管理", "StateManage", null),
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