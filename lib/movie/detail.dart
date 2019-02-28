import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MovieDetail extends StatefulWidget {
  MovieDetail({Key key, @required this.id, @required this.title})
      : super(key: key);

  final String id;
  final String title;

  @override
  _MovieDetailState createState() => _MovieDetailState();
}

class _MovieDetailState extends State<MovieDetail> {
  var _minfo = {};

  bool _isloading = true;

  @override
  void initState() {
    super.initState();
    getMovieDetail();
  }

  getMovieDetail() async {
    // var temp = await movieApi.getMovieDetail(widget.id);
    print(widget.id);

    var response = await http.get(
        'http://api.douban.com/v2/movie/subject/${widget.id}');

    var data = json.decode(response.body);
    // print(data);
    setState(() {
      _minfo = data;
      _isloading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${widget.title}----${widget.id}',
          // style: TextStyle(fontSize: 14),
        ),
        centerTitle: true,
      ),
      body: _renderInfo(),
    );
  }

  Widget _renderInfo() {
    if (_isloading) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return ListView(
        children: <Widget>[
          Padding(
            child: Image.network(_minfo['images']['large'], height: 350),
            padding: EdgeInsets.symmetric(vertical: 15),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 4),
            child: Text(
              _minfo['summary'],
              style: TextStyle(height: 1.5),
            ),
          )
        ],
      );
    }
  }
}
