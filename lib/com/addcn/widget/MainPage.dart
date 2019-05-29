import 'package:flutter/material.dart';
import 'package:flutter_app/com/addcn/model/MainModel.dart';
import 'package:flutter_app/com/addcn/model/MainTabPageModel.dart';
import 'package:flutter_app/com/addcn/widget/ContainerPage.dart';
import 'package:flutter_app/com/addcn/widget/ControlsPage.dart';
import 'package:flutter_app/com/addcn/widget/OtherPage.dart';
import 'package:scoped_model/scoped_model.dart';

///主页
class MainPage extends StatefulWidget {
  @override
  MainPageState createState() => new MainPageState();
}

class MainPageState extends State<MainPage> {
  MainTabPageModel model;
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
    return ScopedModelDescendant<MainModel>(
      builder: (context, _, model) {
        return new Scaffold(
          appBar: new AppBar(
            title: new Text(model.list[position].titile),
            centerTitle: true,
          ),
          body: contentView(),
          bottomNavigationBar: new BottomNavigationBar(
            items: model.list.map((bean) {
              return getBarItem(bean.position, bean.icon, bean.titile);
            }).toList(),
            currentIndex: position,
            onTap: (int index) => onTabChange(index),
          ),
        );
      },
    );
  }

  //静态获取model用法实例
  Model getModel(BuildContext context) {
    MainModel countModel = MainModel().of(context);
    return countModel;
  }

  ///底部tab切换
  void onTabChange(int index) {
    setState(() {
      position = index;
    });
  }
}
