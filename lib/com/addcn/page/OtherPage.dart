import 'package:flutter/material.dart';
import 'package:flutter_app/com/addcn/bean/TestBean.dart';

class OtherPage extends StatelessWidget {
  TestBean testBean = new TestBean("0");

  OtherPage(this.testBean);

  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 60,
      alignment: Alignment.center,
      child: new Text(testBean.value),
    );
  }
}
