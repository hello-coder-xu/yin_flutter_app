import 'package:flutter/material.dart';

///进度视图
class ProgressPage extends StatefulWidget {
  @override
  _ProgressPageState createState() => _ProgressPageState();
}

class _ProgressPageState extends State<ProgressPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: new Text('进度视图'),
          centerTitle: true,
        ),
        body: CustomScrollView(
          slivers: <Widget>[
            new SliverList(
              delegate: new SliverChildListDelegate(
                <Widget>[
                  ListTile(
                    title: new Text('条形进度'),
                    subtitle: new Text('第一种'),
                  ),
                  new LinearProgressIndicator(),
                  ListTile(
                    subtitle: new Text('第二种'),
                  ),
                  new LinearProgressIndicator(
                    valueColor: new AlwaysStoppedAnimation<Color>(Colors.green),
                  ),
                  ListTile(
                    subtitle: new Text('第三种'),
                  ),
                  new LinearProgressIndicator(
                    backgroundColor: Colors.deepPurpleAccent,
                    valueColor: new AlwaysStoppedAnimation<Color>(Colors.red),
                  ),
                  ListTile(
                    subtitle: new Text('第四种(设置特定的值)'),
                  ),
                  new LinearProgressIndicator(
                    backgroundColor: Colors.white,
                    value: 0.3,
                    valueColor: new AlwaysStoppedAnimation<Color>(
                        Colors.deepPurpleAccent),
                  ),
                  ListTile(
                    title: new Text('圆形进度'),
                    subtitle: new Text('第一种'),
                  ),
                  Align(
                    child: new CircularProgressIndicator(),
                  ),
                  ListTile(
                    subtitle: new Text('第二种'),
                  ),
                  Align(
                    child: new CircularProgressIndicator(
                      valueColor:
                          new AlwaysStoppedAnimation<Color>(Colors.green),
                    ),
                  ),
                  ListTile(
                    subtitle: new Text('第三种'),
                  ),
                  Align(
                    child: new CircularProgressIndicator(
                      backgroundColor: Colors.deepPurpleAccent,
                      valueColor: new AlwaysStoppedAnimation<Color>(Colors.red),
                    ),
                  ),
                  ListTile(
                    subtitle: new Text('第四种(设置特定的值)'),
                  ),
                  Align(
                    child: new CircularProgressIndicator(
                      backgroundColor: Colors.white,
                      value: 0.3,
                      valueColor: new AlwaysStoppedAnimation<Color>(
                          Colors.deepPurpleAccent),
                    ),
                  ),
                  ListTile(
                    subtitle: new Text('第五种(设置线条粗细)'),
                  ),
                  Align(
                    child: new CircularProgressIndicator(
                      backgroundColor: Colors.white,
                      strokeWidth: 10,
                      valueColor: new AlwaysStoppedAnimation<Color>(
                          Colors.deepPurpleAccent),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
