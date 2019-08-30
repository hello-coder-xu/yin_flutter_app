import 'package:flutter/material.dart';

Function showSheet(BuildContext context, Widget child) {
  final GlobalKey widgetKey = GlobalKey();

  close() async {
    await (widgetKey.currentState as SheetBottomState).dissmiss();
  }

  Navigator.push(
      context,
      PageRouteBuilder(
        opaque: false,
        pageBuilder: (context, primaryRouteAnimation, secondaryAnimation) {
          return SheetBottom(key: widgetKey, child: child);
        },
        settings: RouteSettings(name: "SheetBottom"),
      ));

  return close;
}

///底部弹框
class SheetBottom extends StatefulWidget {
  final Widget child;

  SheetBottom({key, @required this.child}) : super(key: key);

  @override
  SheetBottomState createState() => new SheetBottomState();
}

class SheetBottomState extends State<SheetBottom> with SingleTickerProviderStateMixin {
  GlobalKey boxKey = GlobalKey();

  Animation<double> offsetAnimation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = new AnimationController(vsync: this, duration: const Duration(milliseconds: 300));

    offsetAnimation =
        Tween<double>(begin: 1000, end: 0).animate(CurvedAnimation(parent: controller, curve: Curves.ease));

    WidgetsBinding.instance.addPostFrameCallback(getBoxHeight);
  }

  void getBoxHeight(Duration time) {
    final double size = boxKey.currentContext.size.height;

    offsetAnimation =
        Tween<double>(begin: size, end: 0).animate(CurvedAnimation(parent: controller, curve: Curves.ease));
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        backgroundColor: Colors.black.withOpacity(0.0),
        body: AnimatedBuilder(
          animation: controller,
          builder: (context, child) {
            Offset offset = Offset(0, offsetAnimation.value);
            return Stack(
              children: <Widget>[
                InkWell(
                  onTap: dissmiss,
                  child: Container(
                    color: Colors.black.withOpacity(0.4),
                  ),
                ),
                Column(
                  children: <Widget>[
                    Transform.translate(
                      offset: offset,
                      child: DecoratedBox(
                          key: boxKey,
                          decoration: BoxDecoration(color: Colors.white.withOpacity(0.0)),
                          child: widget.child),
                    ),
                  ],
                  mainAxisAlignment: MainAxisAlignment.end,
                ),
              ],
            );
          },
        ),
      ),
      onWillPop: () => requestPop(),
    );
  }

  Future requestPop() {
    dissmiss();
    return Future.value(false);
  }

  void dissmiss() {
    controller.reverse();
    Navigator.pop(context);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
