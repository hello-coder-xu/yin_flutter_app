import 'package:flutter/material.dart';
import 'package:flutter_app/com/addcn/comm/Common.dart';
import 'package:flutter_app/com/addcn/view/AppBarPage.dart';
import 'package:flutter_app/com/addcn/view/ButtonPage.dart';
import 'package:flutter_app/com/addcn/view/CheckPage.dart';
import 'package:flutter_app/com/addcn/view/ChipPage.dart';
import 'package:flutter_app/com/addcn/view/DividerPage.dart';
import 'package:flutter_app/com/addcn/view/DrawerPage.dart';
import 'package:flutter_app/com/addcn/view/FormPage.dart';
import 'package:flutter_app/com/addcn/view/ImagePage.dart';
import 'package:flutter_app/com/addcn/view/ListViewPage.dart';
import 'package:flutter_app/com/addcn/view/PageViewPage.dart';
import 'package:flutter_app/com/addcn/view/ProgressPage.dart';
import 'package:flutter_app/com/addcn/view/RadioPage.dart';
import 'package:flutter_app/com/addcn/view/SwitchPage.dart';
import 'package:flutter_app/com/addcn/view/TabPage.dart';
import 'package:flutter_app/com/addcn/view/TextFieldPage.dart';
import 'package:flutter_app/com/addcn/view/TextViewPage.dart';
import 'package:flutter_app/com/addcn/widget/MainPage.dart';

dynamic mapValue(Map map, String key) {
  return map == null || map.containsKey(key) ? null : map[key];
}

var rootHandler = new Handler(handlerFunc: (BuildContext context, dynamic params) {
  if (params != null) {
    print('$params');
  }
  return new MainPage();
});

var textViewPageHandler = new Handler(handlerFunc: (BuildContext context, Map params) {
  String name = mapValue(params, "name");
  print('$name');
  return new TextViewPage(name: name);
});

var textFieldPageHandler = new Handler(handlerFunc: (BuildContext context, dynamic params) {
  return new TextFieldPage();
});

var formPageHandler = new Handler(handlerFunc: (BuildContext context, dynamic params) {
  return new FormPage();
});

var buttonPageHandler = new Handler(handlerFunc: (BuildContext context, dynamic params) {
  return new ButtonPage();
});

var imagePageHandler = new Handler(handlerFunc: (BuildContext context, dynamic params) {
  return new ImagePage();
});

var appBarPageHandler = new Handler(handlerFunc: (BuildContext context, dynamic params) {
  return new AppBarPage();
});

var drawerPageHandler = new Handler(handlerFunc: (BuildContext context, dynamic params) {
  return new DrawerPage();
});

var tabPageHandler = new Handler(handlerFunc: (BuildContext context, dynamic params) {
  return new TabPage();
});

var radioPageHandler = new Handler(handlerFunc: (BuildContext context, dynamic params) {
  return new RadioPage();
});

var checkPageHandler = new Handler(handlerFunc: (BuildContext context, dynamic params) {
  return new CheckPage();
});

var switchPageHandler = new Handler(handlerFunc: (BuildContext context, dynamic params) {
  return new SwitchPage();
});

var chipPageHandler = new Handler(handlerFunc: (BuildContext context, dynamic params) {
  return new ChipPage();
});

var dividerPageHandler = new Handler(handlerFunc: (BuildContext context, dynamic params) {
  return new DividerPage();
});

var progressPageHandler = new Handler(handlerFunc: (BuildContext context, dynamic params) {
  return new ProgressPage();
});
var pageViewPageHandler = new Handler(handlerFunc: (BuildContext context, dynamic params) {
  return new PageViewPage();
});
var listViewPageHandler = new Handler(handlerFunc: (BuildContext context, dynamic params) {
  return new ListViewPage();
});
