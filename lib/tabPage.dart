import 'package:flutter/material.dart';

import './firstPage.dart' as firstpage;
import './secondPage.dart' as secondpage;

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

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tabs app'),
        backgroundColor: Colors.teal,
        // bottom: TabBar(
        //   tabs: <Widget>[
        //     new Tab(icon: Icon(Icons.access_alarm)),
        //     new Tab(icon: Icon(Icons.chat)),
        //   ],
        //   controller: _tabController,
        // ),
      ),
      bottomNavigationBar: Material(
        color: Colors.teal,
        child: TabBar(
          controller: _tabController,
          tabs: <Widget>[
            new Tab(icon: Icon(Icons.access_alarm)),
            new Tab(icon: Icon(Icons.chat)),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          new firstpage.FirstPage(),
          new secondpage.SecondPage(),
        ],
      ),
    );
  }
}
