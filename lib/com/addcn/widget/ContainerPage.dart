import 'package:flutter/material.dart';
import 'package:flutter_app/com/addcn/az/MyAzlistview.dart';
import 'package:flutter_app/com/addcn/bean/PageBean.dart';
import 'package:flutter_app/com/addcn/view/AnimatedBuilderPage.dart';
import 'package:flutter_app/com/addcn/view/NestedScrollViewPage.dart';
import 'package:flutter_app/com/addcn/view/SliverPage.dart';

///容器视图
class ContainerPage extends StatefulWidget {
  @override
  ContainerPageState createState() => new ContainerPageState();
}

class ContainerPageState extends State<ContainerPage> {
  List<PageBean> items = [
    PageBean("水平视图", "Row", null),
    PageBean("垂直视图", "Column", null),
    PageBean("相对视图", "Stock", null),
    PageBean("滚动视图", "Sliver", SliverPage()),
    PageBean("动画视图", "AnimatedWidget", AnimatedBuilderPage()),
    PageBean("滚动视图", "NestedScrollView", NestedScrollViewPage()),
    PageBean("容器视图", "Container", null),
    PageBean("盒子视图", "SizedBox", null),
    PageBean("城市选择", "AzListView", MyAzListView()),
  ];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: ListView.separated(
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              items[index].name,
              style: Theme.of(context).textTheme.title,
            ),
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
