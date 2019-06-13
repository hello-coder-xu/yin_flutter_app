import 'package:flutter/material.dart';
import 'package:emoji_picker/emoji_picker.dart';

///表情包
class EmojiPage extends StatefulWidget {
  @override
  EmojiPageState createState() => new EmojiPageState();
}

class EmojiPageState extends State<EmojiPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('表情包'),
        centerTitle: true,
      ),
      body: EmojiPicker(
        rows: 3,
        columns: 7,

        numRecommended: 5,
        onEmojiSelected: (emoji, category) {
          print(emoji);
        },
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
