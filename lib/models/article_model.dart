import 'dart:convert';

ArticleModel articleModelFromMap(String str) =>
    ArticleModel.fromMap(json.decode(str));

String articleModelToMap(ArticleModel data) => json.encode(data.toMap());

class ArticleModel {
  ArticleModel({
    this.articles,
  });

  List<Article> articles;

  factory ArticleModel.fromMap(Map<String, dynamic> json) => ArticleModel(
        articles:
            List<Article>.from(json["articles"].map((x) => Article.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "articles": List<dynamic>.from(articles.map((x) => x.toMap())),
      };
}

class Article {
  Article({
    this.aid,
    this.title,
    this.body,
    this.date,
    this.img,
  });

  String aid;
  String title;
  String body;
  String date;
  String img;

  factory Article.fromMap(Map<String, dynamic> json) => Article(
        aid: json["aid"],
        title: json["title"],
        body: json["body"],
        date: json["date"],
        img: json["img"],
      );

  Map<String, dynamic> toMap() => {
        "aid": aid,
        "title": title,
        "body": body,
        "date": date,
        "img": img,
      };
}
