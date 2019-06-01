import 'package:flutter/material.dart';
import 'package:flutter_app/com/addcn/bean/PageBean.dart';
import 'package:flutter_app/com/addcn/view/AppBarPage.dart';
import 'package:flutter_app/com/addcn/view/ButtonPage.dart';
import 'package:flutter_app/com/addcn/view/DrawerPage.dart';
import 'package:flutter_app/com/addcn/view/FormPage.dart';
import 'package:flutter_app/com/addcn/view/ImagePage.dart';
import 'package:flutter_app/com/addcn/view/TabPage.dart';
import 'package:flutter_app/com/addcn/view/TextFieldPage.dart';
import 'package:flutter_app/com/addcn/view/TextViewPage.dart';

///控件视图
class ControlsPage extends StatefulWidget {
  @override
  ControlsPageState createState() => new ControlsPageState();
}

class ControlsPageState extends State<ControlsPage> {
  List<PageBean> items = [
    PageBean("文本", "TextView", TextViewPage()),
    PageBean("输入框", "TextField", TextFieldPage()),
    PageBean("表单", "From", FormPage()),
    PageBean("按钮", "Button", ButtonPage()),
    PageBean("图片", "ImageView", ImagePage()),
    PageBean("标题栏", "AppBar", AppBarPage()),
    PageBean("抽屉", "Drawer", DrawerPage()),
    PageBean("Tab", "TabView", TabPage()),
    PageBean("单选", "Radio", null),
    PageBean("复选", "Check", null),
    PageBean("标签", "Chip", null),
    PageBean("进度", "Progress", null),
    PageBean("webview", "webview", null),
    PageBean("页面滚动", "PageView", null),
    PageBean("列表", "ListView", null),
    PageBean("网格", "GridView", null),
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
