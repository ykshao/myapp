import 'package:flutter/material.dart';
import '../common/eventBus.dart';

class ChildTwo extends StatefulWidget {
  ChildTwo({Key key, this.data4Two, this.callback}) : super(key: key);
  final callback;
  final String data4Two;

  @override
  ChildTwoState createState() => new ChildTwoState();
}

class ChildTwoState extends State<ChildTwo> {
  String data = '';
  String inputTxt;
  TextEditingController controller = new TextEditingController();

  void initState() {
    super.initState();
    print('data4Two' + widget.data4Two);
    data = widget.data4Two;
  }

  void firedA() {
    widget.callback('$inputTxt');
  }

  void firedB() {
    eventBus.fire(new MyEvent('$inputTxt'));
  }

  void _onChanged(String value) {
    setState(() {
      inputTxt = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(10.0),
        padding: const EdgeInsets.only(top: 30.0, bottom: 50.0),
        decoration: BoxDecoration(color: Colors.blue[100]),
        // Row is a horizontal, linear layout.
        child: new Center(
            child: new Column(children: <Widget>[
          new Container(
            padding: new EdgeInsets.only(bottom: 15.0),
            child: new Text('子组件2'),
          ),
          new Container(
            padding: new EdgeInsets.only(bottom: 10.0),
            child: new Text('父传子:' + data),
          ),
          new Container(
              margin: new EdgeInsets.only(bottom: 40.0),
              child: new TextField(
                  controller: controller,
                  onChanged: _onChanged,
                  decoration: (new InputDecoration(labelText: '请输入你要发送的值')))),
          new Container(
              child: new RaisedButton(
                  onPressed: firedA, child: new Text('to父组件'))),
          new Container(
              child: new RaisedButton(
                  onPressed: firedB, child: new Text('to兄弟组件')))
        ])));
  }
}
