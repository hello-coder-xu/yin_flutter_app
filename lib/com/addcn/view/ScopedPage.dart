import 'package:flutter/material.dart';
import 'package:flutter_app/com/addcn/model/MainModel.dart';
import 'package:flutter_app/com/addcn/model/ScopedPageModel.dart';
import 'package:scoped_model/scoped_model.dart';

class ScopedPage extends StatefulWidget {
  @override
  ScopedPageState createState() => new ScopedPageState();
}

class ScopedPageState extends State<ScopedPage> {
  int number = 0;

  ScopedPageModel model;

  Widget contentView() {
    List<Widget> views = new List();

    views.add(Text("$number"));
    views.add(Text("${model.count}"));
//    views.add(TestText('我是第一个'));
    if (number % 2 == 0) {
      views.add(TestText('我是第一个'));
    } else {
      views.add(TestText('我是第二个'));
    }
    views.add(RaisedButton(
      onPressed: () {
        Navigator.push(context, new MaterialPageRoute(builder: (context) => TwoPage()));
      },
      child: new Text('跳转'),
    ));

    return ScopedModelDescendant<MainModel>(
      builder: (context, _, model) {
        return Container(
          alignment: Alignment.center,
          child: Column(
            children: views,
            mainAxisSize: MainAxisSize.min,
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    print('StatePage build');
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
    model = MainModel().of(context);
    print('StatePage initState');
  }

  @override
  void didUpdateWidget(ScopedPage oldWidget) {
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
    print('TestText build');
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

class TwoPage extends StatefulWidget {
  @override
  TwoPageState createState() => new TwoPageState();
}

class TwoPageState extends State<TwoPage> {
  ScopedPageModel model;

  @override
  Widget build(BuildContext context) {
    print('TwoPage build');
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('第二个页面'),
      ),
      body: RaisedButton(
        onPressed: model.add,
        child: new Text('add'),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    model = MainModel().of(context);
    print('TwoPage  initState');
  }

  @override
  void didUpdateWidget(TwoPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('TwoPage  didUpdateWidget');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('TwoPage  didChangeDependencies');
  }

  @override
  void deactivate() {
    print('TwoPage  deactivate');
  }

  @override
  void dispose() {
    super.dispose();
    print('TwoPage  dispose');
  }

  @override
  void reassemble() {
    print('TwoPage  reassemble 我热重载了');
  }
}
