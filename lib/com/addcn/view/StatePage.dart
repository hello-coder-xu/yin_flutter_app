import 'package:flutter/material.dart';

class StatePage extends StatefulWidget {
  @override
  StatePageState createState() => new StatePageState();
}

class StatePageState extends State<StatePage> {
  int number = 0;

  Widget contentView() {
    List<Widget> views = new List();

    views.add(Text("$number"));
    if (number % 2 == 0) {
      views.add(TestText('我是第一个'));
    } else {
      views.add(TestText('我是第二个'));
    }
    return Column(
      children: views,
      mainAxisAlignment: MainAxisAlignment.center,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('state生命周期'),
      ),
      body: contentView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            number += 1;
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    print('StatePage initState');
  }

  @override
  void didUpdateWidget(StatePage oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('StatePage didUpdateWidget');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('StatePage didChangeDependencies');
  }

  @override
  void deactivate() {
    print('StatePage deactivate');
  }

  @override
  void dispose() {
    super.dispose();
    print('StatePage dispose');
  }

  @override
  void reassemble() {
    print('StatePage reassemble 我热重载了');
  }
}

class TestText extends StatefulWidget {
  final String value;

  TestText(this.value);

  @override
  TestTextState createState() => new TestTextState();
}

class TestTextState extends State<TestText> {
  @override
  Widget build(BuildContext context) {
    return new Material(
      child: Text(widget.value),
    );
  }

  @override
  void initState() {
    super.initState();
    print('TestText ${widget.value} initState');
  }

  @override
  void didUpdateWidget(TestText oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('TestText ${widget.value} didUpdateWidget');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('TestText ${widget.value} didChangeDependencies');
  }

  @override
  void deactivate() {
    print('TestText ${widget.value} deactivate');
  }

  @override
  void dispose() {
    super.dispose();
    print('TestText ${widget.value} dispose');
  }

  @override
  void reassemble() {
    print('TestText ${widget.value} reassemble 我热重载了');
  }
}
