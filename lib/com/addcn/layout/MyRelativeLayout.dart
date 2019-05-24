import 'package:flutter/material.dart';
import 'package:yin_utils/yin_utils.dart';
import 'package:flutter_app/com/addcn/component/Toast.dart';

///相对布局
class MyRelativeLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('相对布局'),
      ),
      body: new Stack(
        children: <Widget>[
          new Container(
            child: new Image.network(
                'https://upload.debug.100.com.tw/banner/1548225189.jpg'),
            width: ScreenUtil.getInstance().screenWidth,
            height: ScreenUtil.getInstance().screenHeight,
          ),
          new Positioned(
            top: 0,
            child: new Container(
              height: ScreenUtil.getInstance().screenHeight -
                  ScreenUtil.getInstance().appBarHeight -
                  ScreenUtil.getInstance().statusBarHeight,
              width: ScreenUtil.getInstance().screenWidth,
              child: new Column(
                children: <Widget>[
                  new Expanded(
                    flex: 1,
                    child: new GestureDetector(
                      onTap: (){
                        Toast.showShort(context: context, message: "background");
                      },
                      child: new Opacity(
                        opacity: 0.5,
                        child: new Container(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  new Container(
                    color: Colors.green,
                    child: new Column(
                      children: <Widget>[
                        new Text('111'),
                        new Text('111'),
                        new Text('111'),
                        new Text('111'),
                        new Text('111'),
                        new Text('111'),
                        new Text('111'),
                        new Text('111'),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
