import 'package:flutter/material.dart';
import 'package:flutter_app/com/addcn/mvp/ui/eventbus.dart';
import 'package:flutter_app/com/addcn/mvp/ui/main/main_model.dart';
import 'package:flutter_app/com/addcn/mvp/ui/main/main_presenter.dart';
import 'package:flutter_app/com/addcn/mvp/ui/util.dart';
import 'package:flutter_app/com/addcn/mvp/ui/widget_one/index.dart';
import 'package:flutter_app/com/addcn/mvp/ui/widget_three/index.dart';
import 'package:flutter_app/com/addcn/mvp/ui/widget_two/index.dart';


Widget divider = Divider(height: 1);

class MvpDemo extends StatefulWidget {
  @override
  MvpDemoState createState() => new MvpDemoState();
}

class MvpDemoState extends State<MvpDemo> with SingleTickerProviderStateMixin {
  MvpPresenter mvpPresenter;
  MvpModel mvpModel;
  TabController tabController;

  List<String> tabs = ['one', 'two'];

  @override
  void initState() {
    super.initState();
    mvpModel = MvpModel(this);
    mvpPresenter = MvpPresenter(model: mvpModel);

    tabController = TabController(vsync: this, initialIndex: 0, length: tabs.length);
    tabController.addListener(mvpPresenter.toggleTabPosition);

    eventBus.on<MainEvent>().listen((event) => mvpPresenter.updateTabPosition());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('mvp模式demo'),
        centerTitle: true,
      ),
      body: MvpDemoWidget(
        presenter: mvpPresenter,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('tabPosition:${mvpModel.tabPosition}'),
                  Text('main:${mvpModel.index}'),
                  Text('one:${mvpModel.oneIndex}'),
                  Text('two:${mvpModel.twoIndex}'),
                  Text('three:${mvpModel.threeIndex}'),
                ],
              ),
            ),
            TabBar(
              tabs: tabs.map((it) => Tab(text: it)).toList(),
              labelColor: Colors.black87,
              unselectedLabelColor: Colors.grey,
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorColor: Colors.deepOrange,
              controller: tabController,
            ),
            divider,
            renderWidget(title: 'Main', index: mvpModel.index, mvpModel: mvpModel, mvpPresenter: mvpPresenter),
            divider,
            OneWidget(),
            divider,
            Expanded(
              child: TabBarView(
                children: [TwoWidget(), ThreeWidget()],
                controller: tabController,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }
}

class MvpDemoWidget extends InheritedWidget {
  final MvpPresenter presenter;

  MvpDemoWidget({this.presenter, Widget child}) : super(child: child);

  static MvpDemoWidget of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(MvpDemoWidget);
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }
}
