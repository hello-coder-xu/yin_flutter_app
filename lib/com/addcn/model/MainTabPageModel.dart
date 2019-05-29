import 'package:flutter/material.dart';
import 'package:flutter_app/com/addcn/bean/TabModel.dart';
import 'package:scoped_model/scoped_model.dart';

mixin MainTabPageModel on Model {
  List<TabModel> list = [
    TabModel(position: 0, titile: "控件", icon: Icons.home),
    TabModel(position: 1, titile: "容器", icon: Icons.home),
    TabModel(position: 2, titile: "其他", icon: Icons.home),
  ];

}
