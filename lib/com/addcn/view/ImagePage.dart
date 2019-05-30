import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

///图片显示
class ImagePage extends StatefulWidget {
  @override
  ImagePageState createState() => new ImagePageState();
}

class ImagePageState extends State<ImagePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('图片显示'),
          centerTitle: true,
        ),
        body: new CustomScrollView(
          slivers: <Widget>[
            new SliverPadding(
              padding: const EdgeInsets.all(16.0),
              sliver: new SliverList(
                delegate: new SliverChildListDelegate(
                  <Widget>[
                    new ListTile(title: new Text('本地资源图片'), subtitle: new Text('资源图片')),
                    Image.asset('assets/image.webp'),
                    new ListTile(title: new Text('网络图片')),
                    new Image.network(
                        "https://cp2.100.com.tw/service/active/2019/02/15/155021601801413807_1500x1040xscale1xsid9276.jpg?webp=1&v=3"),
                    new ListTile(title: new Text('网络图片'), subtitle: new Text('加载圈+自动缓存+加载错误')),
                    new CachedNetworkImage(
                      placeholder: (context, url) {
                        return new Container(
                          height: 40,
                          width: 40,
                          child: new CircularProgressIndicator(),
                        );
                      },
                      width: 160,
                      height: 160,
                      imageUrl: 'xxx',
                      errorWidget: (context, url, error) {
                        return new Image.asset(
                          'assets/test.jpeg',
                          width: 160,
                          height: 160,
                        );
                      },
                    ),
                    new ListTile(title: new Text('裁剪'), subtitle: new Text('充满父容器 BoxFit.fill ')),
                    Image.asset(
                      'assets/image.webp',
                      width: double.infinity,
                      height: 100,
                      fit: BoxFit.fill,
                    ),
                    new ListTile(title: new Text('裁剪'), subtitle: new Text('充满容器，可能会被截断 BoxFit.cover')),
                    Image.asset(
                      'assets/image.webp',
                      width: double.infinity,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                    new ListTile(title: new Text('裁剪'), subtitle: new Text('尽可能大，保持图片分辨率 BoxFit.contain')),
                    Image.asset(
                      'assets/image.webp',
                      width: double.infinity,
                      height: 100,
                      fit: BoxFit.scaleDown,
                    ),
                    new ListTile(title: new Text('裁剪'), subtitle: new Text('图片居中显示，不改变分大小，可能会被截断 BoxFit.none')),
                    Image.asset(
                      'assets/image.webp',
                      width: double.infinity,
                      height: 100,
                      fit: BoxFit.none,
                    ),
                    new ListTile(title: new Text('裁剪'), subtitle: new Text('图片填满宽度，高度可能会被截断 BoxFit.fitWidth')),
                    Image.asset(
                      'assets/image.webp',
                      width: double.infinity,
                      height: 100,
                      fit: BoxFit.fitWidth,
                    ),
                    new ListTile(title: new Text('裁剪'), subtitle: new Text('图片填满高度，宽度可能会被截断 BoxFit.fitHeight')),
                    Image.asset(
                      'assets/image.webp',
                      width: double.infinity,
                      height: 100,
                      fit: BoxFit.fitHeight,
                    ),
                    new ListTile(title: new Text('裁剪'), subtitle: new Text('图片可以完整显示，但是可能不能填充满 BoxFit.scaleDown')),
                    Image.asset(
                      'assets/image.webp',
                      width: double.infinity,
                      height: 100,
                      fit: BoxFit.scaleDown,
                    ),
                    new ListTile(subtitle: new Text('边角 10度')),
                    new ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.asset('assets/image.webp'),
                    ),
                    new ListTile(title: new Text('椭圆')),
                    new ClipOval(
                      child: Image.asset('assets/image.webp'),
                    ),
                    new SizedBox(height: 16.0),
                    new CircleAvatar(
                      radius: 36.0,
                      backgroundImage: AssetImage('assets/image.webp'),
                    ),
                    new ListTile(title: new Text('圆型'), subtitle: new Text('网络')),
                    Align(
                      child: new ClipOval(
                        child: new FadeInImage.assetNetwork(
                          placeholder: "images/normal_user_icon.webp",
                          //预览图
                          fit: BoxFit.cover,
                          image:
                              "https://cp2.100.com.tw/service/active/2019/02/15/155021601801413807_1500x1040xscale1xsid9276.jpg?webp=1&v=3",
                          width: 120.0,
                          height: 120.0,
                        ),
                      ),
                    ),
                    new ListTile(title: new Text('圆型'), subtitle: new Text('圆形图片+加文字')),
                    new Align(
                      child: new Container(
                        width: 100.0,
                        height: 100.0,
                        child: new CircleAvatar(
                          backgroundImage: new AssetImage("assets/test.jpeg"),
                          child: new Text("李二", style: new TextStyle(color: Colors.red)), //可以在图片上添加文字等等
                        ),
                      ),
                    ),
                    new ListTile(title: new Text('布局上加图片背景'), subtitle: new Text('本地')),
                    new Container(
                      width: double.infinity,
                      height: 100,
                      decoration: new BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/test.jpeg"),
                          fit: BoxFit.none,
                        ),
                      ),
                      alignment: Alignment.center,
                      child: new Title(color: Colors.red,child: new Text('我是一个内容')),
                    ),
                    new ListTile(title: new Text('布局上加图片背景'), subtitle: new Text('网络')),
                    new Container(
                      width: double.infinity,
                      height: 100,
                      decoration: new BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage("https://cp2.100.com.tw/service/active/2019/02/15/155021601801413807_1500x1040xscale1xsid9276.jpg?webp=1&v=3"),
                          fit: BoxFit.none,
                        ),
                      ),
                      alignment: Alignment.center,
                      child: new Title(color: Colors.red,child: new Text('我是一个内容')),
                    )
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
