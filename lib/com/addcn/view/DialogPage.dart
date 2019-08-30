import 'package:flutter/material.dart';
import 'package:flutter_app/com/addcn/component/SheetBottom.dart';

class DialogPage extends StatefulWidget {
  @override
  DialogPageState createState() => new DialogPageState();
}

class DialogPageState extends State<DialogPage> {
  Function sheetClose;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('dialog'),
      ),
      body: RaisedButton(
        child: Text('btn'),
        onPressed: () {
          sheetClose = showSheet(context, TextContentView("",close));
        },
      ),
    );
  }

  void close() {
    print('test close');
    sheetClose();
  }
}

class TextContentView extends StatefulWidget {
  final String value;
  final Function sheetClose;

  TextContentView(this.value, this.sheetClose);

  @override
  TextContentViewState createState() => new TextContentViewState();
}

class TextContentViewState extends State<TextContentView> {
  TextEditingController controller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Text('取消'),
              Expanded(
                child: Text('title',textAlign: TextAlign.center,),
              ),
              IconButton(
                icon: Icon(Icons.clear),
                onPressed: widget.sheetClose,
              ),
            ],
          ),
          Container(
            height: 200,
            color: Colors.red,
            child: TextField(
              decoration: InputDecoration(hintText: "请输入内容"),
              controller: controller,
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
