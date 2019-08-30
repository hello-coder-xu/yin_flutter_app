import 'package:flutter/material.dart';

///对话框-基类
class DialogBase extends StatefulWidget {
  final Widget contentView;
  final Alignment alignment;

  DialogBase(
    this.contentView, {
    this.alignment = Alignment.center,
  });

  @override
  DialogBaseState createState() => new DialogBaseState();
}

class DialogBaseState extends State<DialogBase> {
  ///内容视图
  Widget contentView() {
    return new Container(
      child: new Column(
        children: [
          widget.contentView,
        ],
        mainAxisAlignment: MainAxisAlignment.end,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return contentView();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
