import 'package:flutter/material.dart';
import 'dart:math';

///SliverAppBarPage视图
class SliverAppBarPage extends StatefulWidget {
  @override
  SliverAppBarPageState createState() => new SliverAppBarPageState();
}

class SliverAppBarPageState extends State<SliverAppBarPage> with TickerProviderStateMixin {
  Widget build(BuildContext context) {
    return new Material(
      child: CustomScrollView(
        slivers: <Widget>[
//          SliverAppBar(
//            title: new Text('第一个SliverAppBar'),
//            centerTitle: true,
//            backgroundColor: Colors.blue,
//            pinned: true, // 是否固定在顶部
//          ),
//          SliverAppBar(
//            title: new Text('第二个SliverAppBar'),
//            centerTitle: true,
//            backgroundColor: Colors.indigoAccent,
//            floating: true, //是否浮动 (pinned=true 设置无效)
//          ),
//          SliverAppBar(
////            title: new Text('第三个SliverAppBar'),
//            floating: true,
//            expandedHeight: 178,
//            flexibleSpace: FlexibleSpaceBar(
//              title: new Text('可伸张视图'),
//              centerTitle: true,
//              background: Image.network(
//                "https://cp2.100.com.tw/service/active/2019/02/15/155021601801413807_1500x1040xscale1xsid9276.jpg?webp=1&v=3",
//                fit: BoxFit.fill,
//              ),
//            ),
//          ),
          SliverAppBar(
            pinned: true,
            title: new Text('第四个SliverAppBar'),
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              background: Image.network(
                "https://cp2.100.com.tw/service/active/2019/02/15/155021601801413807_1500x1040xscale1xsid9276.jpg?webp=1&v=3",
                fit: BoxFit.fill,
              ),
            ),
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.cake), text: '左侧'),
                Tab(icon: Icon(Icons.golf_course), text: '右侧'),
              ],
              controller: TabController(length: 2, vsync: this),
            ),
          ),
          SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, //一行显示2个
              crossAxisSpacing: 5.0, //列间距
              mainAxisSpacing: 5.0, //行间距
              childAspectRatio: 1.0, //内容显示比例 1.0=宽/高
            ),
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  margin: EdgeInsets.only(bottom: 10),
                  color: Color.fromARGB(
                    100,
                    new Random().nextInt(255),
                    new Random().nextInt(255),
                    new Random().nextInt(255),
                  ),
                );
              },
              childCount: 60,
            ),
          ),
        ],
      ),
    );
  }
}
