import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

///状态管理
class ScopedModelPage extends StatefulWidget {
  @override
  ScopedModelPageState createState() => new ScopedModelPageState();
}

class ScopedModelPageState extends State<ScopedModelPage> {
  @override
  Widget build(BuildContext context) {
    return ScopedModel(
      model: CounterModel(),
      child: new Scaffold(
        appBar: new AppBar(
          title: new Text('状态管理'),
          centerTitle: true,
        ),
        body: CounterWraper(),
        floatingActionButton: ScopedModelDescendant<CounterModel>(
          rebuildOnChange: false,
          builder: (context, _, model) => FloatingActionButton(
                child: new Icon(Icons.add),
                onPressed: model.add,
              ),
        ),
      ),
    );
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
    return ScopedModelDescendant<CounterModel>(
      builder: (context, _, model) => ActionChip(
            onPressed: model.add,
            backgroundColor: Colors.blue,
            label: new Text('${model._count}'),
          ),
    );
  }
}

class CounterModel extends Model {
  int _count = 0;

  int get count => _count;

  void add() {
    _count += 1;
    notifyListeners();
  }
}
