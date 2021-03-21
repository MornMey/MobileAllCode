import 'package:flutter_application_1/models/article_model.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';

Future<ArticleModel> get readArticleData async {
  String url = "http://10.0.2.2:8080/AppFlutter/read.php";

  http.Response response = await http.get(url);

  if (response.statusCode == 200) {
    String body = response.body;
    return compute(articleModelFromMap, body);
  } else {
    throw Exception("Error while reading: ${response.statusCode}");
  }
}

Future<String> insertData(Article article) async {
  String url = "http://10.0.2.2:8080/AppFlutter/insert.php";
  http.Response response = await http.post(url, body: article.toMap());
  if (response.statusCode == 200) {
    return response.body;
  } else {
    throw Exception("Error while writing: ${response.statusCode}");
  }
}

Future<String> updateData(Article article) async {
  String url = "http://10.0.2.2:8080/AppFlutter/update.php";
  http.Response response = await http.post(url, body: article.toMap());
  if (response.statusCode == 200) {
    return response.body;
  } else {
    throw Exception("Error while writing: ${response.statusCode}");
  }
}

Future<String> deleteData(Article article) async {
  String url = "http://10.0.2.2:8080/AppFlutter/delete.php";
  http.Response response = await http.post(url, body: article.toMap());
  if (response.statusCode == 200) {
    return response.body;
  } else {
    throw Exception("Error while writing: ${response.statusCode}");
  }
}
