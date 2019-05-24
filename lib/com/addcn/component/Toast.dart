import 'package:yin_utils/yin_utils.dart';
import 'package:flutter/material.dart';

class Toast {
  static double _HEIGTH = ScreenUtil.getInstance().screenHeight;
  static double _WIDTH = ScreenUtil.getInstance().screenWidth;

  static const int _SHORT = 1000;
  static const int _LONG = 2000;

  static const double _TOP = 0.3;
  static const double _CENTER = 0.5;
  static const double _BOTTOM = 0.7;

  //短-底
  static void showShort(
      {@required BuildContext context, @required String message}) {
    _show(
        context: context,
        message: message,
        timeType: _SHORT,
        locationType: _BOTTOM);
  }

  //长-底
  static void showLong(
      {@required BuildContext context, @required String message}) {
    _show(
        context: context,
        message: message,
        timeType: _LONG,
        locationType: _BOTTOM);
  }

  //短-中
  static void showShortCenter(
      {@required BuildContext context, @required String message}) {
    _show(
        context: context,
        message: message,
        timeType: _SHORT,
        locationType: _CENTER);
  }

  //短-中
  static void showLongCenter(
      {@required BuildContext context, @required String message}) {
    _show(
        context: context,
        message: message,
        timeType: _LONG,
        locationType: _CENTER);
  }



  static void _show(
      {@required BuildContext context,
      @required String message,
      @required int timeType,
      @required double locationType}) {
    //创建一个OverlayEntry对象
    OverlayEntry overlayEntry = new OverlayEntry(builder: (context) {
      return new Positioned(
          top: _HEIGTH * locationType,
          child: new Container(
            alignment: Alignment.center,
            width: _WIDTH,
            child: new Center(
              child: new Card(
                child: new Padding(
                  padding: EdgeInsets.all(8),
                  child: new Text(message),
                ),
                color: Colors.grey,
              ),
            ),
          ));
    });
    //往Overlay中插入插入OverlayEntry
    Overlay.of(context).insert(overlayEntry);
    new Future.delayed(Duration(milliseconds: timeType)).then((value) {
      overlayEntry.remove();
    });
  }
}
