import 'package:flutter/material.dart';

//viewpager
class MyViewPager extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ViewPagerState();
  }
}

class ViewPagerState extends State<MyViewPager> {
  int currentPageIndex = 0;
  var pageController = new PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Viewpager'),
      ),
      body: new Container(
        alignment: Alignment.center,
        child: new Column(
          children: <Widget>[
            new Text(
              '显示viewpager',
              style: new TextStyle(color: Colors.black),
            ),
            new SizedBox(
              height: 200,
              child: new PageView.builder(
                itemBuilder: (context, index) {
                  return pageItem(context, index);
                },
                onPageChanged: pageChange,
                controller: pageController,
                itemCount: 5,
              ),
            ),
            new RaisedButton(
              onPressed: changePageInde,
              color: Colors.redAccent,
              child: new Text('跳转'),
            )
          ],
        ),
      ),
    );
  }

  void changePageInde() {
    pageController.animateToPage(2, duration: const Duration(microseconds: 2000), curve: Curves.easeIn);
    pageController.jumpToPage(2);
  }

  //页面切换事件
  void pageChange(int index) {
    setState(() {
      if (currentPageIndex != index) {
        currentPageIndex = index;
      }
    });
  }

  Widget pageItem(BuildContext context, int index) {
    return new Container(
      color: index % 2 == 0 ? Colors.blue : Colors.red,
      alignment: Alignment.center,
      height: 100,
      child: new Text(
        '我是第$index个',
        style: new TextStyle(color: Colors.white),
      ),
    );
  }
}
