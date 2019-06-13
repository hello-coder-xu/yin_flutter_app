import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

String html =
    '''<h1>This is &nbsp;heading 1</h1><a href="https://google.com">Google</a><br/><img alt="Test Image" src="https://source.unsplash.com/random/300x200"><br/>''';

///文本视图
class TextViewPage extends StatelessWidget {
  ///text item 视图
  Widget textItem({Widget view, String describe}) {
    List<Widget> views = new List();
    views.add(view);
    views.add(new Text("使用:\n$describe"));
    return new Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.only(bottom: 20),
      child: new Column(
        children: views,
        crossAxisAlignment: CrossAxisAlignment.start,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("TextView"),
          centerTitle: true,
        ),
        body: Container(
          padding: EdgeInsets.all(10),
          child: new CustomScrollView(
            slivers: <Widget>[
              new SliverList(
                delegate: new SliverChildListDelegate(
                  <Widget>[
                    textItem(
                      view: new Text('16号字体:', style: new TextStyle(fontSize: 16)),
                      describe: "fontSize: 16",
                    ),
                    textItem(
                      view: new Text('红色的字体:', style: new TextStyle(color: Colors.red, fontSize: 16)),
                      describe: "new TextStyle(color: Colors.red)",
                    ),
                    textItem(
                      view: new Text('我要倾斜了:', style: new TextStyle(fontStyle: FontStyle.italic, fontSize: 16)),
                      describe: "new TextStyle(fontStyle: FontStyle.italic)",
                    ),
                    textItem(
                      view: new Text('我要加粗了:', style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                      describe: "new TextStyle(fontWeight: FontWeight.bold)",
                    ),
                    textItem(
                      view: new Text(
                        '我只显示2行，超过渐渐隐去，我只显示2行，超过渐渐隐去，我只显示2行，超过渐渐隐去，我只显示2行，超过渐渐隐去，我只显示2行，超过渐渐隐去，我只显示2行，超过渐渐隐去，我只显示2行，超过渐渐隐去，',
                        maxLines: 2,
                        style: new TextStyle(fontSize: 24, color: Colors.blue),
                        overflow: TextOverflow.fade,
                      ),
                      describe: '''maxLines: 2,\noverflow: TextOverflow.fade''',
                    ),
                    textItem(
                      view: new Text(
                        '我只显示2行，超过就剪裁，我只显示1行，超过就剪裁，我只显示1行，超过就剪裁，我只显示1行，超过就剪裁，我只显示1行，超过就剪裁，我只显示1行，超过就剪裁，我只显示1行，超过就剪裁，',
                        maxLines: 2,
                        style: new TextStyle(fontSize: 24, color: Colors.blue),
                        overflow: TextOverflow.clip,
                      ),
                      describe: '''maxLines: 2,\noverflow: TextOverflow.fade''',
                    ),
                    textItem(
                      view: new Text(
                        '我只显示1行，超过显示省略号，我只显示1行，超过显示省略号，我只显示1行，超过显示省略号，我只显示1行，超过显示省略号，我只显示1行，超过显示省略号，我只显示1行，超过显示省略号，我只显示1行，超过显示省略号，',
                        maxLines: 2,
                        style: new TextStyle(fontSize: 24, color: Colors.blue),
                        overflow: TextOverflow.ellipsis,
                      ),
                      describe: '''maxLines: 2,\noverflow: TextOverflow.ellipsis''',
                    ),
                    textItem(
                      view: new Text(
                        '我加删除线了',
                        style: new TextStyle(fontSize: 16, decoration: TextDecoration.lineThrough, color: Colors.red),
                      ),
                      describe: "new TextStyle(decoration: TextDecoration.lineThrough)",
                    ),
                    textItem(
                      view: new Text(
                        '我加上划线了',
                        style: new TextStyle(fontSize: 16, decoration: TextDecoration.overline, color: Colors.red),
                      ),
                      describe: "new TextStyle(decoration: TextDecoration.overline)",
                    ),
                    textItem(
                      view: new Text(
                        '我加下划线了',
                        style: new TextStyle(fontSize: 16, decoration: TextDecoration.underline, color: Colors.red),
                      ),
                      describe: "new TextStyle(decoration: TextDecoration.overline)",
                    ),
                    textItem(
                      view: new Text(
                        '我加下划线了',
                        style: new TextStyle(fontSize: 16, decoration: TextDecoration.underline, color: Colors.red),
                      ),
                      describe: "new TextStyle(decoration: TextDecoration.overline)",
                    ),
                    new Text('左对齐', textAlign: TextAlign.left, style: new TextStyle(fontSize: 24)),
                    textItem(view: new Container(), describe: "textAlign: TextAlign.left"),
                    new Text('中对齐', textAlign: TextAlign.center, style: new TextStyle(fontSize: 24)),
                    textItem(view: new Container(), describe: "textAlign: TextAlign.center"),
                    new Text('右对齐', textAlign: TextAlign.right, style: new TextStyle(fontSize: 24)),
                    textItem(view: new Container(), describe: "textAlign: TextAlign.right"),
                    textItem(
                        view: new RichText(
                          text: TextSpan(
                              text: '显示多种格式',
                              style: new TextStyle(fontSize: 16, color: Colors.black),
                              children: <TextSpan>[
                                TextSpan(text: '加粗', style: TextStyle(fontWeight: FontWeight.bold)),
                                TextSpan(text: '的'),
                                TextSpan(text: '红色', style: TextStyle(color: Colors.red)),
                                TextSpan(text: '的'),
                                TextSpan(text: '斜体', style: TextStyle(fontStyle: FontStyle.italic)),
                                TextSpan(text: '的'),
                                TextSpan(text: '30号', style: TextStyle(fontSize: 30)),
                                TextSpan(text: '的内容'),
                              ]),
                        ),
                        describe: "查看RichText使用方式"),
                    new Html(
                      data: html,
                      onLinkTap: (url) {
                        print("Opening $url...");
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
