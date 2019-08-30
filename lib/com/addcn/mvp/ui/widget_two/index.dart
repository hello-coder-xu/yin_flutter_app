import 'package:flutter/material.dart';
import 'package:flutter_app/com/addcn/mvp/ui/main/index.dart';
import 'package:flutter_app/com/addcn/mvp/ui/main/main_model.dart';
import 'package:flutter_app/com/addcn/mvp/ui/main/main_presenter.dart';
import 'package:flutter_app/com/addcn/mvp/ui/util.dart';

class TwoWidget extends StatefulWidget {
  @override
  TwoWidgetState createState() => new TwoWidgetState();
}

class TwoWidgetState extends State<TwoWidget> {
  MvpPresenter mvpPresenter;
  MvpModel mvpModel;

  void initData() {
    MvpDemoWidget mvpDemoWidget = MvpDemoWidget.of(context);
    mvpPresenter = mvpDemoWidget.presenter;
    mvpModel = mvpPresenter.model;
  }

  @override
  Widget build(BuildContext context) {
    initData();
    return renderWidget(title: 'TWO', index: mvpModel.twoIndex, mvpModel: mvpModel, mvpPresenter: mvpPresenter);
  }
}
