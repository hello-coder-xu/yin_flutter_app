import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

///图片
class MyImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Image控件'),
        actions: <Widget>[new IconButton(icon: new Icon(Icons.search), onPressed: null)],
      ),
      body: CustomScrollView(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        slivers: <Widget>[
          new SliverPadding(
            padding: const EdgeInsets.all(20.0),
            sliver: new SliverList(
                delegate: new SliverChildListDelegate(<Widget>[
              new Text('网络圆型图片'),
              Align(
                child: new ClipOval(
                  child: new FadeInImage.assetNetwork(
                    placeholder: "images/normal_user_icon.webp",
                    //预览图
                    fit: BoxFit.fill,
                    image:
                        "https://cp2.100.com.tw/service/active/2019/02/15/155021601801413807_1500x1040xscale1xsid9276.jpg?webp=1&v=3",
                    width: 120.0,
                    height: 120.0,
                  ),
                ),
              ),
              new Align(
                child: new Container(
                  width: 120.0,
                  height: 120.0,
                  child: new CircleAvatar(
                    backgroundImage: new NetworkImage(
                      "https://cp2.100.com.tw/service/active/2019/02/15/155021601801413807_1500x1040xscale1xsid9276.jpg?webp=1&v=3",
                    ),
                    child: new Text(
                      "李二",
                      style: new TextStyle(color: Colors.red),
                    ), //可以在图片上添加文字等等
                  ),
                ),
              ),
              new Text('方式1网络加载'),
              Image.network(
                'https://cp2.100.com.tw/service/active/2019/02/15/155021601801413807_1500x1040xscale1xsid9276.jpg?webp=1&v=3',
                width: 160,
                height: 160,
                fit: BoxFit.cover,
              ),
              new Text('方式2网络加载+缓存'),
              new CachedNetworkImage(
                placeholder: (context, url) => new CircularProgressIndicator(),
                width: 160,
                height: 160,
                imageUrl:
                    'https://cp2.100.com.tw/service/active/2019/023/151/155021601801413807_1500x1040xscale1xsid9276.jpg?webp=1&v=3',
                errorWidget: (context, url, error) => new Image.asset(
                      'assets/test.jpeg',
                      width: 160,
                      height: 160,
                    ),
              ),
              new Text('本地图片'),
              Image.asset(
                'assets/image.webp',
                width: 160,
                height: 160,
                fit: BoxFit.cover,
              ),
              new Text('本地圆角图片'),
              new ClipRRect(
                borderRadius: BorderRadius.circular(6.0),
                child: Image.asset(
                  'assets/image.webp',
                ),
              ),
            ])),
          )
        ],
      ),
    );
  }
}
