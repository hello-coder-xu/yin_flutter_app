//import 'package:flutter/material.dart';
//import 'package:local_notifications/local_notifications.dart';
//
////本地通知栏
//class MyNotification extends StatefulWidget {
//  @override
//  MyAppState createState() => new MyAppState();
//}
//
//class MyAppState extends State<MyNotification> {
////  String _imageUrl = 'https://flutter.io/images/catalog-widget-placeholder.png';
//  String _imageUrl = 'https://cp1.100.com.tw/service/active/2019/03/19/155298232473015008_750.jpg?webp=1&v=4';
//  String _text;
//  bool loggingEnabled = false;
//
//  //通知点击事件
//  onNotificationClick(String payload) {
//    setState(() {
//      _text = '传递的参数是: $payload';
//    });
//  }
//
//  //回复点击
//  onReplyClick(String payload) {
//    setState(() {
//      _text = '传递的参数是: $payload';
//    });
//    LocalNotifications.removeNotification(0);
//  }
//
//  //移除通知
//  void removeNotify(String payload) async {
//    await LocalNotifications.removeNotification(0);
//  }
//
//  //通道
//  static const AndroidNotificationChannel channel =
//      const AndroidNotificationChannel(
//    id: '默认通道id',
//    name: '通道名',
//    description: '通道描述',
//    importance: AndroidNotificationChannelImportance.HIGH,
//    vibratePattern: AndroidVibratePatterns.DEFAULT,
//  );
//
//
//  //创建通道
//  Widget _getAddNotificationChannelButton() {
//    return new RaisedButton(
//      child: new Text('创建通道(Android 8.0+)'),
//      onPressed: () async {
//        await LocalNotifications.createAndroidNotificationChannel(
//            channel: channel);
//      },
//    );
//  }
//
//  //移除通道按钮
//  Widget _getRemoveNotificationChannelButton() {
//    return new RaisedButton(
//      child: new Text('移除通道按钮 (Android 8.0+)'),
//      onPressed: () async {
//        await LocalNotifications.removeAndroidNotificationChannel(
//            channel: channel);
//      },
//    );
//  }
//
//  //是否显示通知log
//  Widget _enableLogging() {
//    return new Row(
//      children: <Widget>[
//        new Switch(
//            value: loggingEnabled,
//            onChanged: (val) async {
//              setState(() {
//                loggingEnabled = val;
//              });
//              await LocalNotifications.setLogging(val);
//            }),
//        new Text('启用或禁用日志记录')
//      ],
//    );
//  }
//
//  //基础通知
//  Widget _getBasicNotification() {
//    return new RaisedButton(
//      onPressed: () async {
//        await LocalNotifications.createNotification(
//            id: 0,
//            title: '基础通知',
//            content: '基础内容',
//            androidSettings: new AndroidSettings(
//              isOngoing: false, //是否常驻
//              channel: channel,
//              priority: AndroidNotificationPriority.HIGH, //优先级别
//            ),
//            onNotificationClick: new NotificationAction(
//                actionText: "some action",
//                callback: removeNotify, //通知点击事件
//                payload: ""));
//      },
//      child: new Text('基础通知'),
//    );
//  }
//
//  //带图片通知
//  Widget _getNotificationWithImage() {
//    return new RaisedButton(
//        onPressed: () async {
//          await LocalNotifications.createNotification(
//            id: 0,
//            title: '图片通知',
//            content: '通知内容中带图片',
//            imageUrl: _imageUrl,
//          );
//        },
//        child: new Text('带图片通知'));
//  }
//
//  //常驻通知-无法移除
//  Widget _getUndismissableNotification() {
//    return new RaisedButton(
//        onPressed: () async {
//          await LocalNotifications.createNotification(
//              id: 0,
//              title: '常驻通知',
//              content: '无法移除',
//              imageUrl: _imageUrl,
//              androidSettings: new AndroidSettings(isOngoing: true));
//        },
//        child: new Text('常驻通知-无法移除'));
//  }
//
//  //移除通知
//  Widget _getRemoveNotification() {
//    return new RaisedButton(
//      onPressed: () async {
//        await LocalNotifications.removeNotification(0);
//      },
//      child: new Text('移除通知'),
//    );
//  }
//
//  //有参数传递的通知
//  Widget _getNotificationWithCallbackAndPayload() {
//    return new RaisedButton(
//      onPressed: () async {
//        await LocalNotifications.createNotification(
//          id: 0,
//          title: '参数传递的通知',
//          content: 'Some content',
//          onNotificationClick: new NotificationAction(
//              actionText: "用于描述此功能，不会显示在界面上",
//              callback: onNotificationClick,
//              payload: "有参数传递的通知"),
//        );
//      },
//      child: new Text('有参数传递的通知'),
//    );
//  }
//
//  //点击通知不启动app
//  Widget _getNotificationWithCallbackAndPayloadInBackground() {
//    return new RaisedButton(
//      onPressed: () async {
//        await LocalNotifications.createNotification(
//          id: 0,
//          title: '参数传递的通知',
//          content: 'Some content',
//          onNotificationClick: new NotificationAction(
//              actionText: "some action",
//              callback: onNotificationClick,
//              payload: "点击通知不启动app",
//              launchesApp: false),
//        );
//      },
//      child: new Text('点击通知不启动app'),
//    );
//  }
//
//  //多个操作通知
//  Widget _getNotificationWithMultipleActionsAndPayloads() {
//    return new RaisedButton(
//      onPressed: () async {
//        await LocalNotifications.createNotification(
//            id: 0,
//            title: '多个操作',
//            content: '... and unique callbacks and/or payloads for each',
//            imageUrl: _imageUrl,
//            onNotificationClick: new NotificationAction(
//                actionText: "some action",
//                callback: onNotificationClick,
//                payload: "some payload",
//                launchesApp: false),
//            actions: [
//              new NotificationAction(
//                  actionText: "启动",
//                  callback: onReplyClick,
//                  payload: "firstAction",
//                  launchesApp: true),
//              new NotificationAction(
//                  actionText: "暂停",
//                  callback: onReplyClick,
//                  payload: "secondAction",
//                  launchesApp: false),
//              new NotificationAction(
//                  actionText: "停止",
//                  callback: onReplyClick,
//                  payload: "thirdAction",
//                  launchesApp: false),
//            ]);
//      },
//      child: new Text('多个操作通知'),
//    );
//  }
//
//  //回调匿名函数通知
//  Widget _getNotificationWithAnonymousFunctionAsCallback() {
//    return new RaisedButton(
//        child: new Text('回调匿名函数通知'),
//        onPressed: () async {
//          await LocalNotifications.createNotification(
//              id: 0,
//              title: '匿名函数回调',
//              content:
//                  '... using anonymous callback with provided callbackName',
//              onNotificationClick: new NotificationAction(
//                  actionText: '', //ignored
//                  callback: (String payload) {
//                    setState(() {
//                      _text = payload;
//                    });
//                  },
//                  payload: '匿名函数回调',
//                  callbackName: 'anonymousName'),
//              actions: [
//                new NotificationAction(
//                  actionText: 'anon',
//                  callback: (String payload) {
//                    setState(() {
//                      _text = payload;
//                    });
//                  },
//                  payload: '匿名函数回调',
//                  callbackName: 'anonymousAction',
//                )
//              ]);
//        });
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return new MaterialApp(
//      home: new Scaffold(
//        appBar: new AppBar(
//          title: new Text('Notification example'),
//        ),
//        body: new Center(
//          child: new Column(
//            children: <Widget>[
//              _enableLogging(),
//              _getBasicNotification(),
//              _getNotificationWithImage(),
//              _getUndismissableNotification(),
//              _getRemoveNotification(),
//              _getNotificationWithCallbackAndPayload(),
//              _getNotificationWithCallbackAndPayloadInBackground(),
//              _getNotificationWithMultipleActionsAndPayloads(),
//              _getNotificationWithAnonymousFunctionAsCallback(),
//              _getAddNotificationChannelButton(),
//              _getRemoveNotificationChannelButton(),
//              new Text(_text ?? "单击带有有效负载的通知，可以在这里查看结果")
//            ],
//          ),
//        ),
//      ),
//    );
//  }
//}
