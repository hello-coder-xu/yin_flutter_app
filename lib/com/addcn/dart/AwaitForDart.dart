import 'package:rxdart/rxdart.dart';
import 'package:flutter/material.dart';

Observable<String> observable = Observable.fromIterable(["hello", "world", "yes", "haha", "good", "hao"]);

main() async {
  print('上午被开水烫了脚');
  await for (String s in observable) {
    print(s);
  }
  print('晚上还没吃饭');
}


class TestPaeg extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(''),
      ),
    );
  }
}

class TextPage extends StatefulWidget {
  @override
  TextState createState() => new TextState();
}

class TextState extends State<TextPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("11"),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  void didUpdateWidget(TextPage oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }
}
