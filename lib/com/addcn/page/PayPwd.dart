import 'package:flutter/material.dart';
import 'package:flutter_app/com/addcn/comm/Config.dart';

///支付密码
class PayPwd extends StatefulWidget {

  @override
  PayPwdState createState() => new PayPwdState();
}

class PayPwdState extends State<PayPwd> {

  TextEditingController pwd;

  @override
  Widget build(BuildContext context) {
    return new Material(
      borderRadius: new BorderRadius.all(Radius.circular(8)),
      child: new Container(
        width: Config.width * 0.8,
        height: 170,
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(8.0),
            ),
          ),
        ),
        child: new Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Container(
              padding: EdgeInsets.only(top: 20),
              height: 50,
              alignment: Alignment.center,
              child: new Text(
                '支付密碼',
                style: new TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
            ),
            new Container(
              height: 60,
              width: Config.width * 0.6,
              color: Colors.white,
              padding: EdgeInsets.only(top: 20),
              alignment: Alignment.center,
              child: new TextField(
                textAlign: TextAlign.center,
                controller: pwd,
                decoration: new InputDecoration(
                  hintText: "點擊輸入支付密碼",
                  fillColor: Colors.red,
                ),
              ),
            ),
            new Container(
              height: 50,
              margin: EdgeInsets.only(top: 10),
              decoration: new BoxDecoration(border: new Border(top: new BorderSide(color: Colors.grey, width: 1))),
              child: new Row(
                children: <Widget>[
                  new Expanded(
                    child: new GestureDetector(
                      onTap: cancelClick,
                      child: new Container(
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius:
                          BorderRadius.only(bottomLeft: Radius.circular(5), bottomRight: Radius.circular(5)),
                          color: Colors.white,
                        ),
                        alignment: Alignment.center,
                        child: new Text(
                          "我再想想",
                          style: new TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  ),
                  new Container(
                    height: 50,
                    width: 1,
                    color:  Colors.grey,
                  ),
                  new Expanded(
                    child: new GestureDetector(
                      onTap: sureClick,
                      child: new Container(
                        height: 50,
                        decoration: new BoxDecoration(
                          borderRadius:
                          BorderRadius.only(bottomRight: Radius.circular(5), bottomLeft: Radius.circular(5)),
                          color: Colors.white,
                        ),
                        alignment: Alignment.center,
                        child: new Text(
                          "確認支付",
                          style: new TextStyle(
                            fontSize: 16,
                            color:  Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  ///取消点击
  void cancelClick() {
    Navigator.pop(context);
  }

  ///确定点击
  void sureClick() {}

  @override
  void dispose() {
    super.dispose();
  }
}
