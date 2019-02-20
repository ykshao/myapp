import 'package:flutter/material.dart';
import '../views/parent.dart';

class Home extends StatefulWidget {
  
  Home({Key key, this.title}) : super(key: key);
  final String title;


  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _text = 'Home页面';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_text)),
      body: Container(
        padding: EdgeInsets.all(32.0),
        child: Center(
          child: Column(
            children: <Widget>[
              Text('this is the home screen'),
              RaisedButton(
                child: Text('next'),
                onPressed: () {
                  Navigator.of(context).pushNamed('/Second');
                },
              ),
              Parent()
            ],
          ),
        ),
      ),
    );
  }
}
