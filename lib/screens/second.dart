import 'package:flutter/material.dart';

class Second extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Second')),
      body: Container(
        padding: EdgeInsets.all(32.0),
        child: Center(
          child: Column(
            children: <Widget>[
              Text('this is the home screen'),
              RaisedButton(
                child: Text('next'),
                onPressed: () {
                  Navigator.of(context).pushNamed('/Third');
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
