import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/article_model.dart';
import 'package:flutter_application_1/page/insert_data_page.dart';
import 'package:flutter_application_1/repos/my_localhost_repo.dart';

class MyLocalApiPage extends StatefulWidget {
  @override
  _MyLocalApiPageState createState() => _MyLocalApiPageState();
}

class _MyLocalApiPageState extends State<MyLocalApiPage> {
  Future _articleData;
  List<Article> _articleList;
  @override
  void initState() {
    super.initState();
    _articleData = readArticleData;
  }

  var _scaffoldKey = GlobalKey<ScaffoldState>();

  _showMessage(String text) {
    // ignore: deprecated_member_use
    _scaffoldKey.currentState.showSnackBar(
      SnackBar(content: Text(text)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: _buildAppBar,
      body: _buildBody,
    );
  }

  get _buildAppBar {
    return AppBar(
      title: Text("My Local API"),
      centerTitle: true,
      actions: [
        IconButton(
          icon: Icon(Icons.add),
          onPressed: () {
            Navigator.of(context)
                .push(
              MaterialPageRoute(
                builder: (context) => InsertLocalAPIPage(),
              ),
            )
                .then((value) {
              setState(() {
                _articleData = readArticleData;
              });
            });
          },
        ),
        IconButton(
          icon: Icon(Icons.update),
          onPressed: () {
            Article article = Article(
              aid: "5",
              title: "new title",
              body: "new body",
              img: "newnoimgage.jpg",
              date: "new date",
            );
            updateData(article).then((value) {
              print("value: $value");
              if (value == "update") {
                _showMessage("Data Updated");
              } else {
                _showMessage("Something went wrong");
              }
            });
          },
        ),
      ],
    );
  }

  get _buildBody {
    return Container(
      alignment: Alignment.center,
      color: Colors.grey[300],
      child: FutureBuilder<ArticleModel>(
        future: _articleData,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print("snapshot.error : ${snapshot.error}");
            return Text(
              "Error while reading data",
              style: TextStyle(fontSize: 20),
            );
          }

          if (snapshot.connectionState == ConnectionState.done) {
            _articleList = snapshot.data.articles;
            return _buildListView;
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }

  get _buildListView {
    return RefreshIndicator(
      onRefresh: () async {
        setState(() {
          _articleData = readArticleData;
        });
      },
      child: ListView.builder(
          itemCount: _articleList.length,
          itemBuilder: (context, index) {
            return _buildItem(_articleList[index]);
          }),
    );
  }

  String _noPicturn =
      "https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/480px-No_image_available.svg.png";

  _buildItem(Article article) {
    article.img = article.img == "" ? _noPicturn : article.img;

    return Card(
      child: ListTile(
        leading: Image.network(article.img),
        title: Text("${article.title}"),
        subtitle: Container(
          width: 150,
          height: 150,
          child: Text("${article.body}"),
        ),
        trailing: IconButton(
          icon: Icon(Icons.delete),
          onPressed: () {
            deleteData(article).then(
              (value) {
                print("value: $value");
                if (value == "deleted") {
                  _showMessage("Data deleted");
                  setState(() {
                    _articleList.remove(article);
                  });
                } else {
                  _showMessage("Something went wrong");
                }
              },
            );
          },
        ),
      ),
    );
  }
}
