import 'package:flutter/material.dart';
import 'package:flutter_app/com/addcn/widget/MainPage.dart';
import 'package:scoped_model/scoped_model.dart';

import 'com/addcn/model/MainModel.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final MainModel model = MainModel();

  @override
  Widget build(BuildContext context) {
    return ScopedModel<MainModel>(
        model: model,
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(primarySwatch: Colors.red, backgroundColor: Colors.white),
          home: MainPage(),
        ));
  }
}
