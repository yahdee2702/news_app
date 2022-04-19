import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/model/article.dart';

String apiKey = dotenv.env['API_KEY'] ?? 'give your own API key.';
String baseUrl = 'https://newsapi.org/v2';

class News {
  Future<List<Article>?> getNews() async {
    List<Article>? list;
    String url = '$baseUrl/top-headlines?country=id&apiKey=$apiKey';
    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      var result = data['articles'] as List;
      list = result.map((json) => Article.fromJSON(json)).toList();
      print(response.body);
      return list;
    } else {
      throw Exception("Tidak dapat mengambil data berita.");
    }
  }

  Future<List<Article>> getNewsByCategory(String category) async {
    List<Article>? list;
    String url =
        '$baseUrl/top-headlines?country=id&category=$category&apiKey=$apiKey';
    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      var result = data['articles'] as List;
      list = result.map((json) => Article.fromJSON(json)).toList();
      print(response.body);
      return list;
    } else {
      throw Exception("Tidak dapat mengambil data category.");
    }
  }
}
