import 'dart:async';

import 'package:flutter/material.dart';

///stream
class StreamPage extends StatefulWidget {
  @override
  StreamPageState createState() => new StreamPageState();
}

class StreamPageState extends State<StreamPage> {
  StreamSubscription streamSubscription;
  StreamController<String> streamController;
  StreamSink streamSink;

  @override
  void initState() {
    super.initState();
    print('create a stream');
    streamController = StreamController.broadcast();
//    Stream<String> stream = Stream.fromFuture(fetchData());
    streamSubscription = streamController.stream.listen(onData, onError: onError, onDone: onDone);
    streamController.stream.listen(onDataTwo, onError: onError, onDone: onDone);
    streamSink = streamController.sink;
    print('create a completed');
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('stream'),
        centerTitle: true,
      ),
      body: new Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            StreamBuilder(
              stream: streamController.stream,
              initialData: "...",
              builder: (context,snapshot){
                return new Text("${snapshot.data}");
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new FlatButton(
                  onPressed: addDataToStream,
                  child: Text('add'),
                ),
                new FlatButton(
                  onPressed: pauseStream,
                  child: Text('暂停'),
                ),
                new FlatButton(
                  onPressed: resumeStream,
                  child: Text('恢复'),
                ),
                new FlatButton(
                  onPressed: cancelStream,
                  child: Text('取消'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<String> fetchData() async {
    await Future.delayed(Duration(seconds: 5));
//    throw "something happende";
    return "hello~";
  }

  ///数据发生改变时执行
  void onData(value) {
    print('$value');
  }

  void onDataTwo(value) {
    print('onDataTwo:$value');
  }

  ///数据发生错误时执行
  void onError(error) {
    print('$error');
  }

  ///数据完成时执行
  void onDone() {
    print('done');
  }

  void addDataToStream() async {
    print('add data to stream');

    String data = await fetchData();
//    streamController.add(data);
    streamSink.add(data);
  }

  ///暂停订阅
  void pauseStream() {
    print('pause streamSubscription');
    streamSubscription.pause();
  }

  ///恢复订阅
  void resumeStream() {
    print('resume streamSubscription');
    streamSubscription.resume();
  }

  ///取消订阅
  void cancelStream() {
    print('cancel streamSubscription');
    streamSubscription.cancel();
  }

  @override
  void dispose() {
    streamController.close();
    super.dispose();
  }
}
