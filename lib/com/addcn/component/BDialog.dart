import 'package:yin_utils/yin_utils.dart';
import 'package:flutter/material.dart';

class BDialog {
  //上下文
  BuildContext context;

  //内容视图
  Widget content;

  TickerProvider tickerProvider;

  //移动动画
  Animation<double> _move;

  //透明动画
  Animation<double> _opacity;

  //动画控制器
  AnimationController _controller;

  //全局视图
  OverlayEntry _overlayEntry;

  //状态
  bool _forward = true;

  //消耗时间
  static const int time = 300;

  static double _HEIGTH = ScreenUtil.getInstance().screenHeight;
  static double _WIDTH = ScreenUtil.getInstance().screenWidth;
  static double _curLeft = _WIDTH;

  BDialog(this.context, this.content);

  //隐藏
  void dissmiss() {
    _backAnimate();
    _removeView();
    _dispose();
  }

  //显示
  void show() {
    _initAnimate();
    _initView();
    _addView();
    _startAnimate();
  }

  //初始化动画
  void _initAnimate() {
    if (_controller != null) {
      return;
    }
    _controller = new AnimationController(
        duration: const Duration(milliseconds: time), vsync: tickerProvider);
    _move = new Tween(begin: 0.0, end: 300.0).animate(_controller);
  }

  //显示视图
  void _initView() {
    if (_overlayEntry != null) {
      return;
    }
    _overlayEntry = new OverlayEntry(builder: (context) {
      return new Stack(
        children: <Widget>[
          new Positioned(
            top: 0,
            left: _curLeft,
            child: new Opacity(
              opacity: _opacity.value,
              child: new Container(
                height: _HEIGTH,
                width: _WIDTH,
                color: Colors.black,
              ),
            ),
          ),
          new Positioned(
            top: _HEIGTH - _move.value,
            child: new Container(
              width: _WIDTH,
              color: Colors.blue,
              height: 300,
            ),
          ),
        ],
      );
    });
  }

  //插入视图
  void _addView() {
    if (_overlayEntry == null) {
      return;
    }
    Overlay.of(context).insert(_overlayEntry);
  }

  //移除视图
  void _removeView() {
    _overlayEntry.remove();
  }

  //显示动画
  void _startAnimate() {
    if (_forward) {
      _controller.forward(); //向前播放动画
    }
    _forward = false;
  }

  //隐藏动画
  void _backAnimate() {
    if (_forward) {
      _controller.reverse(); //向后播放动画
    }
    _forward = true;
  }

  //销毁
  void _dispose() {
    _controller.dispose();
    _controller = null;
    _move = null;
    _opacity = null;
    _forward = true;
    _overlayEntry = null;
  }
}
