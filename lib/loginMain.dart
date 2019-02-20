// import 'dart:async';
// import 'dart:convert';
import 'package:flutter/material.dart';

import './setting.dart';
import './login.dart';

//添加http模块
// import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter hello world 例子'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _title = 'App Bar Demo';
  Widget _screen;
  Login _login;
  Settings _settings;

  _MyHomePageState() {
    _login = new Login();
    _settings = new Settings();
    _screen = _settings;
  }

  void _pressed(String message) {
    print(message);
  }

  void _goHome() {
    print('_goHome');
    _setAuthenticated(true);
  }

  void _logout() {
    print('_logout');
    _setAuthenticated(false);
  }

  void _setAuthenticated(bool auth) {
    setState(() {
      if (auth) {
        _screen = _settings;
        _title = 'welcome';
      } else {
        _screen = _login;
        _title = 'please login';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(_title),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.home),
                onPressed: () {
                  _goHome();
                }),
            IconButton(
                icon: Icon(Icons.exit_to_app),
                onPressed: () {
                  _logout();
                }),
            IconButton(
                icon: Icon(Icons.people),
                onPressed: () {
                  _pressed('Alert Pressed');
                })
          ],
        ),
        body: _screen,
      ),
    );
  }
}
