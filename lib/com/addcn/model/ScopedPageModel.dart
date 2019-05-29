import 'package:flutter/material.dart';
import 'package:flutter_app/com/addcn/view/ScopedModelPage.dart';
import 'package:scoped_model/scoped_model.dart';

mixin ScopedPageModel on Model {
  int _count = 0;

  int get count => _count;

  void add() {
    _count += 1;
    notifyListeners();
  }

  void toTwoPage(BuildContext context) {
    Navigator.push(
      context,
      new MaterialPageRoute(
        builder: (context) => new ScopedModelTwoPage(),
      ),
    );
  }
}
