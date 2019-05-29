import 'package:flutter/material.dart';

///状态管理
class StateManagePage extends StatefulWidget {
  @override
  StateManagePageState createState() => new StateManagePageState();
}

class StateManagePageState extends State<StateManagePage> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return CounterProvider(
      count: count,
      add: add,
      child: new Scaffold(
        appBar: new AppBar(
          title: new Text('状态管理'),
          centerTitle: true,
        ),
        body: CounterWraper(),
        floatingActionButton: FloatingActionButton(
          child: new Icon(Icons.add),
          onPressed: add,
        ),
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
    return Center(
      child: Conuter(),
    );
  }
}

///三级
class Conuter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final int count = CounterProvider.of(context).count;
    final VoidCallback add = CounterProvider.of(context).add;
    return ActionChip(
      onPressed: add,
      backgroundColor: Colors.blue,
      label: new Text('$count'),
    );
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
