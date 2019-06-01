import 'package:flutter/material.dart';

///抽屉栏
class DrawerPage extends StatefulWidget {
  @override
  _DrawerPageState createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  ///左边抽屉
  Widget leftDrawer() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.all(0),
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: new Text('shuaige',
                style: new TextStyle(fontWeight: FontWeight.bold)),
            accountEmail: new Text('544806988@qq.com'),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://gss0.bdstatic.com/-4o3dSag_xI4khGkpoWK1HF6hhy/baike/w%3D268%3Bg%3D0/sign=ab1d80c6d533c895a67e9f7de92814cd/b3b7d0a20cf431ad6fd6b4684736acaf2edd985f.jpg"),
            ),
            decoration: BoxDecoration(
              color: Colors.red.shade50,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                    "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1559384942964&di=c3cb4f372ab2b87581fe86f360b4cec1&imgtype=0&src=http%3A%2F%2Fpic146.nipic.com%2Ffile%2F20171112%2F25779728_185942485034_2.jpg"),
                colorFilter: ColorFilter.mode(
                  Colors.red.shade50.withOpacity(0.5),
                  BlendMode.lighten,
                ),
              ),
            ),
          ),
          ListTile(
            title: new Text('Message', textAlign: TextAlign.right),
            trailing: Icon(Icons.message, color: Colors.black12, size: 12.0),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: new Text('Favorite', textAlign: TextAlign.right),
            trailing: Icon(Icons.favorite, color: Colors.black12, size: 12.0),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: new Text('settings', textAlign: TextAlign.right),
            trailing: Icon(Icons.settings, color: Colors.black12, size: 12.0),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }

  ///右边抽屉
  Widget rightDrawer() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.all(0),
        children: <Widget>[
          DrawerHeader(
            child: new Text("right Drawer header".toUpperCase()),
            decoration: BoxDecoration(color: Colors.grey),
          ),
          ListTile(
            title: new Text('Message', textAlign: TextAlign.left),
            trailing: Icon(Icons.message, color: Colors.black12, size: 12.0),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: new Text('Favorite', textAlign: TextAlign.left),
            trailing: Icon(Icons.favorite, color: Colors.black12, size: 12.0),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: new Text('settings', textAlign: TextAlign.left),
            trailing: Icon(Icons.settings, color: Colors.black12, size: 12.0),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        actions: <Widget>[
          Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.settings),
                onPressed: () {
                  Scaffold.of(context).openEndDrawer();
                },
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              );
            },
          ),
        ],
        title: new Text('抽屉栏'),
        centerTitle: true,
      ),
      drawer: leftDrawer(),
      endDrawer: rightDrawer(),
      body: Align(
        child: new Column(
          children: <Widget>[
            new ListTile(
              title: new Text('抽屉栏分两种'),
              subtitle: new Text('左边抽屉(drawer)与右边抽屉(endDrawer)'),
            ),
            new ListTile(
              title: new Text('左边抽屉(drawer)'),
              subtitle: new Text(
                  '1，在Scaffold中，设置drawer的视图就显示左边抽屉栏；\n2，可以根据需要设置appBar中leading图标来控制左边抽屉开关(不设置leading，系统默认会新增按钮图标供用户操作)'),
            ),
            new ListTile(
              title: new Text('右边抽屉(endDrawer)'),
              subtitle: new Text(
                  '1，在Scaffold中，设置endDrawer的视图就显示右边抽屉栏；\n2，可以根据需要设置appBar中actions图标来控制右边抽屉开关(不设置actions，系统默认会新增按钮图标供用户操作)'),
            )
          ],
        ),
      ),
    );
  }
}
