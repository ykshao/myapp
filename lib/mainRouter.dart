import 'package:flutter/material.dart';
import 'package:myapp/screens/home.dart';
import 'package:myapp/screens/second.dart';
import 'package:myapp/screens/third.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      routes: <String, WidgetBuilder>{
        '/Home': (BuildContext context) => new Home(),
        '/Second': (BuildContext context) => new Second(),
        '/Third': (BuildContext context) => new Third()
      },
      home: Home(title: 'asdfasdfasdf'),
    );
  }
}


