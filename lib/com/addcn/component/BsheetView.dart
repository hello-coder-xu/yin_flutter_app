import 'package:yin_utils/yin_utils.dart';
import 'package:flutter/material.dart';

class BsheetView {
  double width = ScreenUtil.getInstance().screenWidth;
  double height = ScreenUtil.getInstance().screenHeight;
  OverlayEntry overlayEntry;

  Widget bottomView;
  BuildContext context;

  BsheetView({this.context, this.bottomView});

  void show() {
    overlayEntry = new OverlayEntry(
      builder: (context) {
        return new Positioned(
          top: ScreenUtil.getInstance().statusBarHeight,
          child: new Container(
            alignment: Alignment.center,
            width: ScreenUtil.getInstance().screenWidth,
            height: ScreenUtil.getInstance().screenHeight - ScreenUtil.getInstance().statusBarHeight,
            child: new Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                new Expanded(
                  flex: 1,
                  child: new GestureDetector(
                    onTap: () {
                      overlayEntry.remove();
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
      },
      opaque: false,
    );
    //往Overlay中插入插入OverlayEntry
    Overlay.of(context).insert(overlayEntry);
  }

  void update() {
    Overlay.of(context).didChangeDependencies();
  }
}
