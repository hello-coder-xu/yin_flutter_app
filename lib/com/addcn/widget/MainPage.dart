import 'package:flutter/material.dart';
import 'package:flutter_app/com/addcn/model/TabModel.dart';
import 'package:flutter_app/com/addcn/widget/ContainerPage.dart';
import 'package:flutter_app/com/addcn/widget/ControlsPage.dart';
import 'package:flutter_app/com/addcn/widget/OtherPage.dart';

///主页
class MainPage extends StatefulWidget {
  @override
  MainPageState createState() => new MainPageState();
}

class MainPageState extends State<MainPage> {
  List<TabModel> list = [
    TabModel(position: 0, titile: "控件", icon: Icons.home),
    TabModel(position: 1, titile: "容器", icon: Icons.home),
    TabModel(position: 2, titile: "其他", icon: Icons.home),
  ];
  int position = 0;

  ///获取颜色
  Color getBarItemColor(int index) {
    return index == position ? Colors.red : Colors.grey;
  }

  ///底部item
  BottomNavigationBarItem getBarItem(int index, IconData icon, String text) {
    return new BottomNavigationBarItem(
      icon: new Icon(icon, color: getBarItemColor(index)),
      title: new Text(text, style: new TextStyle(color: getBarItemColor(index))),
    );
  }

  ///内容视图
  Widget contentView() {
    switch (position) {
      case 0:
        return ControlsPage();
      case 1:
        return ContainerPage();
      case 2:
        return OtherPage();
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(list[position].titile),
        centerTitle: true,
      ),
      body: contentView(),
      bottomNavigationBar: new BottomNavigationBar(
        items: list.map((bean) {
          return getBarItem(bean.position, bean.icon, bean.titile);
        }).toList(),
        currentIndex: position,
        onTap: (int index) => onTabChange(index),
      ),
    );
  }

  ///底部tab切换
  void onTabChange(int index) {
    setState(() {
      position = index;
    });
  }
}
