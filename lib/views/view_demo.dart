import 'package:flutter/material.dart';


import 'each_view.dart';

class ViewDemo extends StatefulWidget {
  @override
  _ViewDemoState createState() => _ViewDemoState();
}

class _ViewDemoState extends State<ViewDemo> {
  List<Widget> _eachView;

  int _index = 0;


  @override
  void initState() {
    super.initState();
    _eachView = List();
    
    _eachView..add(EachView('Home'))..add(EachView('airport_shuttle'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _eachView[_index],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) {
            return EachView('new page');
          }));
        },
        tooltip: 'button FloatingActionButton',
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Colors.green,
        shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.home),
              color: Colors.white,
              onPressed: () { 
                setState(() {
                  _index = 0;
                });
              },
            ),
            IconButton(
              icon: Icon(Icons.airport_shuttle),
              color: Colors.white,
              onPressed: () {
                setState(() {
                  _index = 1;
                });
              },
            ),
            
          ],
        ),
      ),
    );
  }
}
