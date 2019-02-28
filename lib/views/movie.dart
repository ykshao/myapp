import 'package:flutter/material.dart';

import '../movie/list.dart';

class MovieView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text('电影列表'),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {},
            )
          ],
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.all(0),
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: Text(
                  'shaoyongkai',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                accountEmail: Text('shaoyongkai@51talk.com'),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://ss0.bdstatic.com/7Ls0a8Sm1A5BphGlnYG/sys/portrait/item/2c2f3736383636323731379c07'),
                ),
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: NetworkImage(
                      'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1550659429462&di=4cc7b41b68b1071cd431dba5df7bca00&imgtype=0&src=http%3A%2F%2Fbpic.588ku.com%2Fback_pic%2F03%2F79%2F75%2F5257c2e4da2a129.jpg'),
                  fit: BoxFit.cover,
                  // colorFilter: ColorFilter.mode(Colors.yellow[400].withOpacity(0.6), BlendMode.hardLight)
                )),
              ),
              ListTile(
                title: Text('用户反馈'),
                trailing: Icon(Icons.feedback),
              ),
              ListTile(
                title: Text('系统设置'),
                trailing: Icon(Icons.settings),
              ),
              ListTile(
                title: Text('我要发布'),
                trailing: Icon(Icons.send),
              ),
              Divider(),
              ListTile(
                title: Text('注销'),
                trailing: Icon(Icons.exit_to_app),
              )
            ],
          ),
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: Colors.black,
          ),
          height: 50,
          child: TabBar(
            labelStyle: TextStyle(height: 0, fontSize: 12),
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.movie_filter),
                text: '正在热映',
              ),
              Tab(
                icon: Icon(Icons.movie_creation),
                text: '即将上映',
              ),
              Tab(
                icon: Icon(Icons.local_movies),
                text: 'Top250',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            MovieList(
              mt: 'in_theaters',
            ),
            MovieList(
              mt: 'coming_soon',
            ),
            MovieList(
              mt: 'top250',
            ),
          ],
        ),
      ),
    );
  }
}
