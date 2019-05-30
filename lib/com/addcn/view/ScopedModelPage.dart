import 'package:flutter/material.dart';
import 'package:flutter_app/com/addcn/model/MainModel.dart';
import 'package:flutter_app/com/addcn/model/ScopedPageModel.dart';
import 'package:scoped_model/scoped_model.dart';

///状态管理
class ScopedModelPage extends StatefulWidget {
  @override
  ScopedModelPageState createState() => new ScopedModelPageState();
}

class ScopedModelPageState extends State<ScopedModelPage> {
  ScopedPageModel model;

  @override
  void initState() {
    super.initState();
    model = MainModel().of(context);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('状态管理'),
        centerTitle: true,
      ),
      body: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CounterWraper(),
          ScopedModelDescendant<MainModel>(
            builder: (context, _, model) => new FlatButton(
              onPressed: () => model.toTwoPage(context),
              child: new Text('toTwoPage'),
            ),
          ),
        ],
      ),
      floatingActionButton: ScopedModelDescendant<MainModel>(
        rebuildOnChange: false,
        builder: (context, _, model) => FloatingActionButton(
              child: new Icon(Icons.add),
              onPressed: model.add,
            ),
      ),
    );
  }

  @override
  void dispose() {
    model.reset();
    super.dispose();
  }
}

///二级
class CounterWraper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Conuter());
  }
}

///三级
class Conuter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<MainModel>(
      builder: (context, _, model) => ActionChip(
            onPressed: model.add,
            backgroundColor: Colors.blue,
            label: new Text('${model.count}'),
          ),
    );
  }
}

class ScopedModelTwoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('ScopedModelTwoPage'),
        centerTitle: true,
      ),
      body: new Center(
        child: ScopedModelDescendant<MainModel>(
          builder: (context, _, model) => new FlatButton(
                onPressed: model.add,
                child: new Text('add'),
              ),
        ),
      ),
    );
  }
}
