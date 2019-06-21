import 'package:flutter/material.dart';

///form表单

class FormPage extends StatefulWidget {
  @override
  FormPageState createState() => new FormPageState();
}

class FormPageState extends State<FormPage> {
  GlobalKey<FormState> formKey = new GlobalKey();
  String name;
  String pwd;
  bool check = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Form表单'),
        centerTitle: true,
      ),
      body: new CustomScrollView(
        slivers: <Widget>[
          new SliverPadding(
            padding: const EdgeInsets.all(16.0),
            sliver: new SliverList(
              delegate: new SliverChildListDelegate(
                <Widget>[
                  new Form(
                    key: formKey,
                    child: new Column(
                      children: <Widget>[
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: "用户名",
                          ),
                          onSaved: (value) {
                            name = value;
                          },
                          onFieldSubmitted: (value) {
                            print("test 111");
                          },
                          validator: (value) {
                            return value.length < 10 ? "用户名不能小于10位" : null;
                          },
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: "密码",
                          ),
                          onSaved: (value) {
                            pwd = value;
                          },
                          validator: (value) {
                            return value.length < 6 ? "密码不能小于6位" : null;
                          },
                        ),
                        Container(
                          child: new Row(
                            children: <Widget>[
                              Container(
                                child: new Checkbox(
                                  value: check,
                                  onChanged: (value) {
                                    setState(() {
                                      check = value;
                                    });
                                  },
                                ),
                              ),
                              new Text("服务条款"),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(16.0),
                          width: double.infinity,
                          child: new RaisedButton(
                            color: Colors.blue,
                            onPressed: login,
                            child: new Text('登入', style: new TextStyle(fontSize: 16, color: Colors.white)),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void login() {
    var form = formKey.currentState;

    if (form.validate()) {
      form.save();
      print(name);
      print(pwd);
    }
  }
}
