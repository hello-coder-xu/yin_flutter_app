import 'package:flutter/material.dart';

//tab
class MyTabBottom extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new TabState();
  }
}

class TabState extends State<MyTabBottom> {
  int currentPageIndex = 0;
  var pageController = new PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Tab视图'),
      ),
      body: new PageView.builder(
        onPageChanged: pageChange,
        controller: pageController,
        itemBuilder: (BuildContext context, int index) {
          return index == 1 ? new Text("我是第一页") : new Text("我是第二页");
        },
        itemCount: 2,
      ),
      bottomNavigationBar: new BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.home),
            title: new Text('首页'),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.next_week),
            title: new Text('内容'),
          ),
        ],
        onTap: onTap,
        currentIndex: currentPageIndex,
      ),
    );
  }

  // bottomnaviagtionbar 和 pageview 的联动
  void onTap(int index) {
    pageController.animateToPage(index,
        duration: const Duration(milliseconds: 300), curve: Curves.ease);
  }

  void pageChange(int index) {
    setState(() {
      if (currentPageIndex != index) {
        currentPageIndex = index;
      }
    });
  }
}
