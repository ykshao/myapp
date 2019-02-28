import 'package:http/http.dart' as http;

class MovieApi {
  // 获取电影列表
  getMovieList(String mt, int page, int pagesize) async {
    int offset = (page - 1) * pagesize;
    var result = await http.get(
        'http://www.liulongbin.top:3005/api/v2/movie/$mt?start=$offset&count=$pagesize');
    return result.body;
  }

  // 获取电影详情
  getMovieDetail(String id) async {
    var result = await http
        .get('http://www.liulongbin.top:3005/api/v2/movie/subject/$id');
    return result.body;
  }

  int add(int n) {
    return ++n;
  }

  int sub(int n) {
    return --n;
  }
}
