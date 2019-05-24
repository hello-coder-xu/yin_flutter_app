import 'package:flutter/material.dart';
import 'package:f_grecaptcha/f_grecaptcha.dart';

///google 验证
class RecaptchaPage extends StatefulWidget {
  @override
  RecaptchaPageState createState() => new RecaptchaPageState();
}

const String SITE_KEY = "6LcHvWUUAAAAAFvxAT_TsJyWlycG9O0dmPra2f2P  ";

enum _VerificationStep { SHOWING_BUTTON, WORKING, ERROR, VERIFIED }

class RecaptchaPageState extends State<RecaptchaPage> {
  // Start by showing the button inviting the user to use the example
  _VerificationStep _step = _VerificationStep.SHOWING_BUTTON;

  void _startVerification() {
    setState(() => _step = _VerificationStep.WORKING);

    FGrecaptcha.verifyWithRecaptcha(SITE_KEY).then((result) {
      setState(
            () => _step = _VerificationStep.VERIFIED,
      );
    }, onError: (e, s) {
      print("Could not verify:\n$e at $s \n");
      setState(
            () => _step = _VerificationStep.ERROR,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget content;

    switch (_step) {
      case _VerificationStep.SHOWING_BUTTON:
        content = new Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            new Text("This example will use the reCaptcha API to verify that you're human"),
            new RaisedButton(
              onPressed: _startVerification,
              child: const Text("VERIFY"),
            )
          ],
        );
        break;
      case _VerificationStep.WORKING:
        content = new Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            new CircularProgressIndicator(),
            new Text("Trying to figure out whether you're human"),
          ],
        );
        break;
      case _VerificationStep.VERIFIED:
        content = new Text("The reCaptcha API returned a token, indicating that you're a human. "
            "In real world use case, you would send use the token returned to "
            "your backend-server so that it can verify it as well.");
        break;
      case _VerificationStep.ERROR:
        content = new Text(
          "我们无法确认你是否是人类:(如果你是人类，就会发生这种情况。没有互联网连接(或者如果你真的是一个机器人)",
        );
    }

    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('reCaptcha example'),
        ),
        body: new Center(
          child: content,
        ),
      ),
    );
  }
}
