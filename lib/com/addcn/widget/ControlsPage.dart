import 'package:flutter/material.dart';
import 'package:flutter_app/com/addcn/bean/PageBean.dart';
import 'package:flutter_app/com/addcn/view/TextViewPage.dart';

///控件视图
class ControlsPage extends StatefulWidget {
  @override
  ControlsPageState createState() => new ControlsPageState();
}

class ControlsPageState extends State<ControlsPage> {
  List<PageBean> items = [
    PageBean("文本", "TextView", TextViewPage()),
    PageBean("输入框", "TextField", null),
    PageBean("按钮", "Button", null),
    PageBean("图片", "ImageView", null),
    PageBean("Tab", "TabView", null),
    PageBean("单选", "Radio", null),
    PageBean("复选", "Check", null),
    PageBean("标签", "Chip", null),
    PageBean("表单", "From", null),
    PageBean("抽屉", "webview", null),
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
