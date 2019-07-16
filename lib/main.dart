import 'package:flutter/material.dart';
import 'package:flutter_app/com/addcn/comm/Application.dart';
import 'package:flutter_app/com/addcn/comm/MyObserver.dart';
import 'package:flutter_app/com/addcn/comm/Router.dart';
import 'package:flutter_app/com/addcn/comm/Routes.dart';
import 'package:flutter_app/com/addcn/widget/MainPage.dart';
import 'package:scoped_model/scoped_model.dart';

import 'com/addcn/model/MainModel.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() => new MyAppState();
}

class MyAppState extends State<MyApp> {
  final MainModel model = MainModel();

  @override
  void initState() {
    Router router = new Router();
    Routes.configureRoutes(router);
    Application.router = router;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModel<MainModel>(
        model: model,
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(primarySwatch: Colors.red, backgroundColor: Colors.white),
          home: MainPage(),
          navigatorObservers: [MyObserver()],
        ));
  }
}
