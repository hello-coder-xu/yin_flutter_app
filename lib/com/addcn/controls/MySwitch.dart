import 'package:flutter/material.dart';

class MySwitch extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new SwitchBody();
  }
}

class SwitchBody extends State<MySwitch> {
  bool check = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('MySwitch'),
      ),
      body: new Column(
        children: <Widget>[
          new Switch(
            value: check,
            activeColor: Colors.blue,
            onChanged: (bool state) {
              this.setState(() {
                this.check = !this.check;
              });
            },
          )
        ],
      ),
    );
  }
}
