import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

///响应式编程
class RxDartPage extends StatefulWidget {
  @override
  RxDartPageState createState() => new RxDartPageState();
}

class RxDartPageState extends State<RxDartPage> {
  PublishSubject<String> subject;
  String textValue = "空";

  @override
  void initState() {
    super.initState();
    subject = PublishSubject<String>();
    subject.listen((value) {
      print("test value=$value");
      setState(() {
        textValue = value;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    subject.close();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('响应式编程'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            child: TextField(
              decoration: InputDecoration(
                labelText: "Title",
                filled: true,
              ),
              onChanged: (value) => subject.add(value),
            ),
          ),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(20),
            child: Text(textValue),
          ),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(20),
            child: FlatButton(
              child: Text("下一个页面"),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => RxDartTwoPage(subject)));
              },
            ),
          ),
        ],
      ),
    );
  }
}

class RxDartTwoPage extends StatelessWidget {
  final PublishSubject<String> subject;

  RxDartTwoPage(this.subject);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('RxDart第二个页面'),
      ),
      body: Align(
        child: FlatButton(
          onPressed: () {
            subject.add("我被修改了");
          },
          child: Text('向上一个页面新增数据'),
        ),
      ),
    );
  }
}
