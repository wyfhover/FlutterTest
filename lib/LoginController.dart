import 'package:flutter/material.dart';

class LoginController extends StatefulWidget {
@override
  State<StatefulWidget> createState() {
    return LoginView();
  }
}

class LoginView extends State<LoginController> {
@override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: _setupApp(),
    );
  }
}

Widget _setupApp() {
  var root = new Scaffold(
    appBar: _setupNaviBar(),
    body: _setupRoot(),
  );
  return root;
}

Widget _setupNaviBar() {
  return new AppBar(
    leading: Icon(Icons.home),
    title: Text(
      '登录',
    ),
    actions: [
      new IconButton(
          icon: new Icon(Icons.account_box), 
          onPressed: (){
            print('2333333');
          }
        )
    ],
  );
}

Widget _setupRoot() {
  return new ListView();
}