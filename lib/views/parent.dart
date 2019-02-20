import 'package:flutter/material.dart';
import '../components/childOne.dart';
import '../components/childTwo.dart';

class Parent extends StatefulWidget {
  @override
  ParentState createState() => new ParentState();
}

class ParentState extends State<Parent> {
  String data = '无';
  String data4Two = '这是传给组件2的值';

  void onDataChange(val) {
    setState(() {
      data = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new ChildOne(),
          new ChildTwo(data4Two: data4Two, callback: (val) => onDataChange(val)),
          new Text('子组件2, 传过来的值: ' + '$data'),
        ],
      ),
    );
  }
}
