import 'package:yin_utils/yin_utils.dart';
import 'package:flutter/material.dart';

class MyBottomSheet extends StatelessWidget {
  final Widget content;
  final Widget bottomView;
  final bool display;
  final Function callBack;

  double width = ScreenUtil.getInstance().screenWidth;
  double height = ScreenUtil.getInstance().screenHeight;
  double curLeft = ScreenUtil.getInstance().screenWidth;

  MyBottomSheet({this.content, this.bottomView, this.callBack, this.display = false});

  ///bottom-底部视图
  Positioned getBottomView() {
    return new Positioned(
      left: display ? 0 : curLeft,
      top: 0,
      bottom: ScreenUtil.getInstance().bottomBarHeight,
      child: new Container(
        height: ScreenUtil.getInstance().screenHeight,
        width: ScreenUtil.getInstance().screenWidth,
        child: new Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            new Expanded(
              flex: 1,
              child: new GestureDetector(
                onTap: () {
                  dissmiss();
                },
                child: new Opacity(
                  opacity: 0.4,
                  child: new Container(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            bottomView,
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      height: height,
      width: width,
      child: new Stack(
        children: <Widget>[
          content,
          getBottomView(),
        ],
      ),
    );
  }

  ///bottom-显示底部视图
  void show() {
    if (!display && callBack != null) {
      callBack();
    }
  }

  ///bottom-隐藏底部视图
  void dissmiss() {
    if (display && callBack != null) {
      callBack();
    }
  }
}
