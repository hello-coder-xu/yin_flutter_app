import 'package:flutter/material.dart';
import 'package:flutter_app/com/addcn/mvp/base/presenter.dart';
import 'package:flutter_app/com/addcn/mvp/ui/main/index.dart';
import 'package:flutter_app/com/addcn/mvp/ui/main/main_model.dart';
import 'package:flutter_app/com/addcn/mvp/ui/widget_four/index.dart';

class MvpPresenter extends Presenter {
  MvpModel model;

  MvpPresenter({this.model}) : super(model: model);

  void toggleTabPosition() {
    TabController tabController = (model.state as MvpDemoState).tabController;
    model.tabPosition = tabController.index;
    if (tabController.indexIsChanging) {
      model.notifyWidget();
    }
  }

  void updateTabPosition() {
    if (model.tabPosition == 0) {
      model.tabPosition = 1;
    } else {
      model.tabPosition = 0;
    }

    TabController tabController = (model.state as MvpDemoState).tabController;
    tabController.animateTo(model.tabPosition);
  }

  void updateIndex() {
    model.index += 1;
    model.notifyWidget();
  }

  void updateOneIndex() {
    model.oneIndex += 1;
    model.notifyWidget();
  }

  void updateTwoIndex() {
    model.twoIndex += 1;
    model.notifyWidget();
  }

  void updateThreeIndex() {
    model.threeIndex += 1;
    model.notifyWidget();
  }

  void showAutoLoading() {
    showLoading();
    Future.delayed(Duration(seconds: 2), () {
      hideLoading();
    });
  }

  void toFour() {
    Navigator.push(model.context, MaterialPageRoute(builder: (context) => FourWidget()));
  }
}
