
import 'package:yin_utils/yin_utils.dart';
import 'package:flutter/material.dart';

class PopView {
  double width = ScreenUtil.getInstance().screenWidth;
  double height = ScreenUtil.getInstance().screenHeight;
  OverlayEntry overlayEntry;

  Widget popView;
  BuildContext context;

  PopView({this.context, this.popView});

  void show() {
    overlayEntry = new OverlayEntry(builder: (context) {
      return new Positioned(
        top: kToolbarHeight,
        right: 20,
        width: 200,
        height: 320,
        child: new SafeArea(
          child: new Material(
            child: new Container(
              color: Colors.black,
              child: new Column(
                children: <Widget>[
                  Expanded(
                    child: new ListTile(
                      leading: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                      title: new Text(
                        "发起群聊",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  Expanded(
                    child: new ListTile(
                      leading: Icon(Icons.add, color: Colors.white),
                      title: new Text("添加朋友", style: TextStyle(color: Colors.white)),
                    ),
                  ),
                  Expanded(
                    child: new ListTile(
                      leading: Icon(Icons.add, color: Colors.white),
                      title: new Text("扫一扫", style: TextStyle(color: Colors.white)),
                    ),
                  ),
                  Expanded(
                    child: new ListTile(
                      leading: Icon(Icons.add, color: Colors.white),
                      title: new Text("首付款", style: TextStyle(color: Colors.white)),
                    ),
                  ),
                  Expanded(
                    child: new ListTile(
                      leading: Icon(Icons.add, color: Colors.white),
                      title: new Text("帮助与反馈", style: TextStyle(color: Colors.white)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
    Overlay.of(context).insert(overlayEntry);
  }

}
