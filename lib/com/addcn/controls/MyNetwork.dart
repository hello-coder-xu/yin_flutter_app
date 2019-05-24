import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app/com/addcn/comm/HttpUtil.dart';
import 'package:http/http.dart';
import '../comm/NetUtil.dart';
import '../bean/devicebean.dart';
import 'package:http/http.dart' as http;

///网络请求

//GET 请求
getHttp() async {
  var url = "http://www.wanandroid.com/project/list/1/json?cid=1";
  NetUtil.get(url, (data) {
    print("test:get");
    Devicebean devicebean = Devicebean.fromJson(data);
    print("test:${devicebean.data.datas[0].author}");
  });
}

//垂直布局

//POST 请求
postHttp() async {
  var value = await HttpUtil.request("goods/get_list", data: {
    "end_price": "",
    "game_id": 1,
    "goods_type_id": "",
    "handover_at": "",
    "is_complete": "",
    "keyword": "",
    "limit": 10,
    "page": 1,
    "server_id": "",
    "sort_by": "",
    "sort_val": "",
    "start_price": ""
  });
  print(value);
}

class MyNetWork extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('Button控件'),
          actions: <Widget>[new IconButton(icon: new Icon(Icons.search), onPressed: null)],
        ),
        body: new Center(
          child: new Column(
            children: <Widget>[
              new FlatButton(
                onPressed: getHttp,
                child: new Text('GET请求'),
                padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                textColor: Colors.white,
                textTheme: ButtonTextTheme.normal,
                color: Colors.green,
                highlightColor: Colors.green,
                colorBrightness: Brightness.light,
                clipBehavior: Clip.antiAlias,
              ),
              new FlatButton(
                onPressed: postHttp,
                child: new Text('POST请求'),
                padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                textColor: Colors.white,
                textTheme: ButtonTextTheme.normal,
                color: Colors.green,
                highlightColor: Colors.green,
                colorBrightness: Brightness.light,
                clipBehavior: Clip.antiAlias,
              ),
            ],
          ),
        ));
  }
}
