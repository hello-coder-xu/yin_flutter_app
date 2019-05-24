import 'package:flutter/material.dart';
import 'package:flutter_app/com/addcn/bean/PageBean.dart';
import 'package:flutter_app/com/addcn/controls/MyAnimations.dart';
import 'package:flutter_app/com/addcn/controls/MyButton.dart';
import 'package:flutter_app/com/addcn/controls/MyDialog.dart';
import 'package:flutter_app/com/addcn/controls/MyEditText.dart';
import 'package:flutter_app/com/addcn/controls/MyImage.dart';
import 'package:flutter_app/com/addcn/controls/MyKeyBoard.dart';
import 'package:flutter_app/com/addcn/controls/MyListViewRefreshAndMore.dart';
import 'package:flutter_app/com/addcn/controls/MyListViewSimple.dart';
import 'package:flutter_app/com/addcn/controls/MyNetwork.dart';
import 'package:flutter_app/com/addcn/controls/MyOkToast.dart';
import 'package:flutter_app/com/addcn/controls/MyOverlay.dart';
import 'package:flutter_app/com/addcn/controls/MyPhoto.dart';
import 'package:flutter_app/com/addcn/controls/MySwitch.dart';
import 'package:flutter_app/com/addcn/controls/MyTabBottom.dart';
import 'package:flutter_app/com/addcn/controls/MyTabTop.dart';
import 'package:flutter_app/com/addcn/view/TextViewPage.dart';
import 'package:flutter_app/com/addcn/controls/MyViewpager.dart';
import 'package:flutter_app/com/addcn/layout/MyLinearLayout.dart';
import 'package:flutter_app/com/addcn/page/MyDatePicker.dart';
import 'package:flutter_app/com/addcn/page/PwdCheckPage.dart';
import 'package:flutter_app/com/addcn/page/RecaptchaPage.dart';

import 'package:flutter_app/com/addcn/layout/MyRelativeLayout.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.red, backgroundColor: Colors.white),
      home: MainPageBody(),
    );
  }
}

class MainPageBody extends StatefulWidget {
  @override
  MainPageState createState() => new MainPageState();
}

class MainPageState extends State<MainPageBody> {
  List<PageBean> items = [
    PageBean("线性布局", "LinearLayout", new MyLinearLayout()),
    PageBean("相对布局", "RelativeLayout", new MyRelativeLayout()),
    PageBean("文本", "text", new TextViewPage()),
    PageBean("按钮", "button", new MyButton()),
    PageBean("输入框", "TextField", new MyEditText()),
    PageBean("键盘", "keyboard", new MyKeyBoard()),
    PageBean("时间选择器", "DatePicker", new MyDatePicker()),
    PageBean("加载网页", "webview", null),
    PageBean("图片", "image", new MyImage()),
    PageBean("对话框", "dialog", new MyDialog()),
    PageBean("动画", "animations", new MyAnimations()),
    PageBean("切换", "switch", new MySwitch()),
    PageBean("照片", "相册和拍照", new MyPhoto()),
    PageBean("画廊", "Viewpager", new MyViewPager()),
    PageBean("提示", "Toast", new MyOkToast()),
    PageBean("网络请求", "http", new MyNetWork()),
    PageBean("顶部Tab", "顶部", new MyTabTop()),
    PageBean("底部Tab", "底部", new MyTabBottom()),
    PageBean("全局视图", "popwindow", new MyOverlay()),
    PageBean("列表", "刷新与更多", new MyListViewRefreshAndMore()),
    PageBean("列表", "简单列表", new MyListViewSimple()),
    PageBean("Google验证", "recaptcha_v2", new RecaptchaPage()),
    PageBean("密码验证", "pwd check", new PwdCheckPage()),
  ];

  ///item视图
  Widget getItemView(int index) {
    return new Container(
      width: 160,
      child: new ListTile(
        title: new Text(items[index].name),
        subtitle: new Text(items[index].subName),
        trailing: new Icon(Icons.keyboard_arrow_right),
        onTap: () => onItemClick(index),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('flutter'),
      ),
      body: new ListView.separated(
        itemCount: items.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return getItemView(index);
        },
        separatorBuilder: (context, index) {
          return Divider(height: 1, color: Colors.blue);
        },
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
