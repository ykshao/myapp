import 'dart:convert';
import 'package:flutter/material.dart';
//添加http模块
import 'package:http/http.dart' as http;
import 'detail.dart';

class MovieList extends StatefulWidget {
  MovieList({Key key, @required this.mt}) : super(key: key);

  //电影类型
  final String mt;

  @override
  _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> with AutomaticKeepAliveClientMixin {
  //默认显示第一页数据
  int page = 1;

  //每页显示的数据条数
  int pagesize = 10;

  var mlist = [];

  //总数据条数
  var total = 0;

  @override
  bool get wantKeepAlive => true;

  //控件创建时会调用 initState
  @override
  void initState() {
    super.initState();
    getMovieList();
  }

  getMovieList() async {
    int offset = (page - 1) * pagesize;
    var response = await http.get(
        'http://api.douban.com/v2/movie/${widget.mt}?start=$offset&count=$pagesize');

    var data = json.decode(response.body);
    // print(data);
    setState(() {
      mlist = data['subjects'];
      total = data['total'];
    });
  }

  @override
  Widget build(BuildContext context) {
    // return Text('这是电影列表' + widget.mt + '--------${mlist.length}');
    return ListView.builder(
      itemCount: mlist.length,
      itemBuilder: (BuildContext context, int i) {
        var item = mlist[i];
        return GestureDetector(
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (BuildContext ctx) {
              return MovieDetail(
                id: item['id'],
                title: item['title'],
              );
            }));
          },
          child: Container(
            height: 200,
            decoration: BoxDecoration(
                // color: Colors.white,
                border: Border(top: BorderSide(color: Colors.black12))),
            child: Row(
              children: <Widget>[
                Image.network(
                  item['images']['small'],
                  width: 130,
                  height: 180,
                  fit: BoxFit.cover,
                ),
                Container(
                  padding: EdgeInsets.only(left: 10),
                  height: 200,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text('电影名称：${item['title']}'),
                      Text('上映年份：${item['year']}年'),
                      Text('电影类型：${item['genres'].join(', ')}'),
                      Text('豆瓣评分：${item['rating']['average']}'),
                      Text('主要演员：${item['title']}'),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
