import 'package:flutter/material.dart';
import 'package:flutter_app/com/addcn/comm/Config.dart';

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

class DialogBaseState extends State<DialogBase> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return new Stack(
      alignment: Alignment.center,
      children: <Widget>[
        new GestureDetector(
          onTap: dissmiss,
          child: new Opacity(
            opacity: 0.2,
            child: new Container(
              height: Config.height,
              width: Config.width,
              color: Colors.black45,
            ),
          ),
        ),
        widget.contentView
      ],
    );
  }

  void dissmiss() {
    Navigator.pop(context);
  }

  @override
  void dispose() {
    super.dispose();
  }
}
