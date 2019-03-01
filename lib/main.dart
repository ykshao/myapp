import 'package:flutter/material.dart';
import './demo/listview_demo.dart';
import './demo/drawer_demo.dart';
import './demo/bottom_navigation_bar_demo.dart';
import './demo/basic_demo.dart';

import './views/view_demo.dart';
// import './views/movie.dart';

//添加http模块
// import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '我的电影',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        // highlightColor: Color.fromRGBO(255, 255, 255, 0.5),
        // splashColor: Colors.white70
      ),
      // home: Home(),
      home: ViewDemo(),
    );
  }
}



class Home extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          // leading: IconButton(
          //   icon: Icon(Icons.menu),
          //   tooltip: 'Navigation',
          //   onPressed: () => debugPrint('Navigation button is onPressed'),
          // ),
          title: Text('app'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              tooltip: 'search',
              onPressed: () => debugPrint('search button is onPressed'),
            ),
          ],
          elevation: 0.0,
          bottom: TabBar(
            unselectedLabelColor: Colors.black38,
            indicatorColor: Colors.black54,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorWeight: 1.0,
            tabs: <Widget>[
              Tab(icon: Icon(Icons.local_florist,)),
              Tab(icon: Icon(Icons.change_history,)),
              Tab(icon: Icon(Icons.directions_bike,)),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            ListViewDemo(),
            BasicDemo(),
            Icon(Icons.directions_bike, size: 128.0,color: Colors.black12,),
          ],
        ),
        drawer: DrawerDemo(),
        bottomNavigationBar: BottomNavigationBarDemo(),
      ),
    );
  }
}

