import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import 'package:weui/drawer/index.dart';
import 'package:yin_utils/com/yin/ScreenUtil.dart';

class AnimatedPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _AnimatedPageState();
  }
}

class _AnimatedPageState extends State<AnimatedPage> {
  bool display = false;

  Widget menuItem(String value) {
    return Expanded(
      child: InkWell(
        onTap: displayContent,
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(value),
              Icon(Icons.arrow_drop_down),
            ],
          ),
          height: 40,
          alignment: Alignment.center,
        ),
      ),
    );
  }

  @override
  build(BuildContext context) {
    List<Widget> views = [];

    views.add(ListView.builder(
      itemBuilder: (context, index) {
        return ListTile(
          title: Text('这是第${index + 1}个'),
        );
      },
      itemCount: 20,
    ));

    if (display) {
      views.add(AnimateView());
    }

    return new Scaffold(
      appBar: AppBar(
        title: Text('动画视图'),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              menuItem("游戏"),
              menuItem("伺服器"),
              menuItem("类型"),
              menuItem("排序"),
            ],
          ),
          Expanded(child: Stack(children: views)),
        ],
      ),
    );
  }

  void displayContent() {
    setState(() {
      display = !display;
    });
  }
}

class AnimateView extends StatefulWidget {
  @override
  AnimateViewState createState() => new AnimateViewState();
}

class AnimateViewState extends State<AnimateView> with SingleTickerProviderStateMixin {
  Animation<double> offsetAnimation;
  AnimationController controller;

  GlobalKey boxKey = GlobalKey();

  @override
  void initState() {
    super.initState();

    controller = new AnimationController(vsync: this, duration: const Duration(milliseconds: 1000));

    offsetAnimation =
        Tween<double>(begin: 1000, end: 0).animate(CurvedAnimation(parent: controller, curve: Curves.ease));

    WidgetsBinding.instance.addPostFrameCallback(getBoxHeight);
  }



  void getBoxHeight(Duration time) {
    final double size = boxKey.currentContext.size.height;

    offsetAnimation =
        Tween<double>(begin: -size, end: 0).animate(CurvedAnimation(parent: controller, curve: Curves.ease));
    // 播放动画
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    Offset offset;
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        print('test value= ${offsetAnimation.value}');
        offset = Offset(0, offsetAnimation.value);
        final List<Widget> children = [];

        children.add(Container(color: Colors.black));
        children.add(Positioned(
          top: 0,
          child: Transform.translate(
            offset: offset,
            child: DecoratedBox(
              key: boxKey,
              decoration: BoxDecoration(color: Colors.white),
              child: child,
            ),
          ),
        ));

        return Stack(children: children);
      },
      child: Container(
        height: 200,
        alignment: Alignment.center,
        color: Colors.green,
        width: ScreenUtil.getInstance().screenWidth,
        child: Text('Test'),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
