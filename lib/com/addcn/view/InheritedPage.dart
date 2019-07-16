import 'package:flutter/material.dart';

///状态管理
class InheritedPage extends StatefulWidget {
  @override
  InheritedPageState createState() => new InheritedPageState();
}

class InheritedPageState extends State<InheritedPage> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
//    return CounterProvider(
//      count: count,
//      add: add,
//      child: new Scaffold(
//        appBar: new AppBar(
//          title: new Text('状态管理'),
//          centerTitle: true,
//        ),
//        body: CounterWraper(),
//        floatingActionButton: FloatingActionButton(
//          child: new Icon(Icons.add),
//          onPressed: add,
//        ),
//      ),
//    );

    return new Scaffold(
      appBar: new AppBar(
        title: new Text('状态管理'),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            ActionChip(
              onPressed: add,
              backgroundColor: Colors.blue,
              label: new Text('$count'),
            ),
             _TextView(count),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: new Icon(Icons.add),
        onPressed: add,
      ),
    );
  }

  void add() {
    setState(() {
      count += 1;
    });
  }
}

///二级
class CounterWraper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('test CounterWraper build');
    final int count = CounterProvider.of(context).count;
    final VoidCallback add = CounterProvider.of(context).add;
    return ActionChip(
      onPressed: add,
      backgroundColor: Colors.blue,
      label: new Text('$count'),
    );
  }
}

class _TextView extends StatelessWidget {
  final int number;

   _TextView(this.number);

  @override
  Widget build(BuildContext context) {
    print('test _TextView build');
    return Text('我没变化  $number');
  }
}

///中间件
class CounterProvider extends InheritedWidget {
  final int count;
  final VoidCallback add;
  final Widget child;

  CounterProvider({this.count, this.add, this.child}) : super(child: child);

  static CounterProvider of(BuildContext context) => context.inheritFromWidgetOfExactType(CounterProvider);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }
}
