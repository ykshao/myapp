import 'package:flutter/material.dart';
import '../common/eventBus.dart';

class ChildOne extends StatefulWidget {
  @override
  ChildOneState createState() => new ChildOneState();
}

class ChildOneState extends State<ChildOne> {
  String data = '无';

  void initState() {
    super.initState();
    eventBus.on<MyEvent>().listen((MyEvent data) => show(data.text));
  }

  void show(String val) {
    setState(() {
      data = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(10.0),
        padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
        decoration: BoxDecoration(color: Colors.blue[100]),
        child: new Center(
            child: new Column(children: <Widget>[
          new Container(
            padding: new EdgeInsets.only(bottom: 15.0),
            child: new Text('子组件1'),
          ),
          new Text('子组件2传来的值:$data'),
        ])));
  }
}
