import 'package:flutter/material.dart';
import 'package:yin_utils/yin_utils.dart';

///按钮视图
class ButtonPage extends StatefulWidget {
  @override
  ButtonPageState createState() => new ButtonPageState();
}

class ButtonPageState extends State<ButtonPage> {
  ///floating 按钮
  Widget floatingActionButtonView() {
    return Container(
      child: new Column(
        children: <Widget>[
          new ListTile(
            title: new Text('悬浮按钮'),
            subtitle: new Text('FloatingAction\n一个页面存在多个FloatingActionButton时，需要加heroTag才行'),
          ),
          new Wrap(
            spacing: 10,
            children: <Widget>[
              new FloatingActionButton(
                heroTag: "round",
                onPressed: () {},
                backgroundColor: Colors.blue,
                child: new Icon(Icons.add),
              ),
              new FloatingActionButton(
                heroTag: "rectangle1",
                onPressed: () {},
                backgroundColor: Colors.blue,
                child: new Icon(Icons.add),
                shape: new BeveledRectangleBorder(),
              ),
              new FloatingActionButton(
                heroTag: "rectangle2",
                onPressed: () {},
                backgroundColor: Colors.blue,
                child: new Icon(Icons.add),
                shape: new BeveledRectangleBorder(borderRadius: BorderRadius.circular(30)),
              ),
              new FloatingActionButton.extended(
                heroTag: "icon",
                onPressed: () {},
                backgroundColor: Colors.blue,
                icon: new Icon(Icons.add),
                label: new Text('add'),
              )
            ],
          )
        ],
      ),
    );
  }

  ///floating 按钮
  Widget flatButtonView() {
    return Container(
      child: new Column(
        children: <Widget>[
          new ListTile(
            title: new Text('扁平按钮'),
            subtitle: new Text('FlatButton'),
          ),
          new Wrap(
            spacing: 10,
            children: <Widget>[
              new FlatButton(
                onPressed: () {},
                child: new Text('FlatButton'),
                textColor: Colors.red,
                splashColor: Colors.green, //渐末颜色
              ),
              new FlatButton.icon(
                onPressed: () {},
                icon: new Icon(Icons.add),
                label: new Text('add'),
                textColor: Colors.red,
                splashColor: Colors.green, //渐末颜色
              ),
            ],
          )
        ],
      ),
    );
  }

  ///floating 按钮
  Widget raisedButtonView() {
    return Container(
      child: new Column(
        children: <Widget>[
          new ListTile(
            title: new Text('突出按钮'),
            subtitle: new Text('RaisedButton'),
          ),
          new Wrap(
            spacing: 10,
            children: <Widget>[
              new RaisedButton(
                onPressed: () {},
                child: new Text('RaisedButton'),
                textColor: Colors.red,
                splashColor: Colors.green, //渐末颜色
              ),
              new RaisedButton(
                onPressed: () {},
                child: new Text('RaisedButton'),
                textColor: Colors.white,
                color: Colors.green,
                shape: new RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                splashColor: Colors.grey, //渐末颜色
              ),
              new RaisedButton.icon(
                onPressed: () {},
                icon: new Icon(Icons.add),
                label: new Text('add'),
                textColor: Colors.red,
                elevation: 5,
                shape: new RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                splashColor: Colors.green, //渐末颜色
              ),
            ],
          )
        ],
      ),
    );
  }

  ///floating 按钮
  Widget outLineButtonView() {
    return Container(
      child: new Column(
        children: <Widget>[
          new ListTile(
            title: new Text('边框按钮'),
            subtitle: new Text('OutLineButton'),
          ),
          new Wrap(
            spacing: 10,
            children: <Widget>[
              new OutlineButton(
                onPressed: () {},
                child: new Text('RaisedButton'),
                textColor: Colors.red,
                borderSide: BorderSide(color: Colors.red),
                splashColor: Colors.green, //渐末颜色
              ),
              new OutlineButton.icon(
                onPressed: () {},
                icon: new Icon(Icons.add),
                label: new Text('add'),
                textColor: Colors.red,
                borderSide: BorderSide(color: Colors.black),
                splashColor: Colors.green,
                shape: new RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                //渐末颜色
                highlightedBorderColor: Colors.deepPurple, //高亮边框颜色
              ),
            ],
          )
        ],
      ),
    );
  }

  ///iconButton 按钮
  Widget iconButtonView() {
    return Container(
      child: new Column(
        children: <Widget>[
          new ListTile(
            title: new Text('图标按钮'),
            subtitle: new Text('IconButton'),
          ),
          new Wrap(
            spacing: 10,
            children: <Widget>[
              new IconButton(
                onPressed: () {},
                icon: Icon(Icons.add),
                splashColor: Colors.green, //渐末颜色
              ),
            ],
          )
        ],
      ),
    );
  }

  ///iconButton 按钮
  Widget popupMenuButtonView() {
    return Container(
      child: new Column(
        children: <Widget>[
          new ListTile(
            title: new Text('菜单选择按钮'),
            subtitle: new Text('PopupMenuButton'),
          ),
          PopupMenuButton(
            onSelected: (value) {
              print(value);
            },
            itemBuilder: (BuildContext context) => [
                  PopupMenuItem(
                    value: 'Home',
                    child: Text('Home'),
                  ),
                  PopupMenuItem(
                    value: 'Discover',
                    child: Text('Discover'),
                  ),
                  PopupMenuItem(
                    value: 'Community',
                    child: Text('Community'),
                  ),
                ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Button视图'),
        centerTitle: true,
      ),
      body: new CustomScrollView(
        shrinkWrap: true,
        slivers: <Widget>[
          new SliverList(
            delegate: new SliverChildListDelegate(
              <Widget>[
                floatingActionButtonView(),
                flatButtonView(),
                raisedButtonView(),
                outLineButtonView(),
                iconButtonView(),
                popupMenuButtonView(),
              ],
            ),
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: new FloatingActionButton(
        onPressed: () {
          TsUtil.showShort(value: "点击Floating");
        },
        heroTag: "bottom",
        child: new Icon(Icons.add),
        backgroundColor: Colors.red,
        shape: new RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
      bottomNavigationBar: new BottomAppBar(
        child: new Container(
          height: 50,
          alignment: Alignment.center,
          child: new Text('底部导航栏'),
        ),
        shape: CircularNotchedRectangle(),
      ),
    );
  }
}
