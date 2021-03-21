import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/randomuser_model.dart';
import 'package:flutter_application_1/page/detail_random_page.dart';
// import 'package:flutter_application_1/page/detail_userrandom_page.dart';
import 'package:flutter_application_1/repos/rendomuser_repo.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class RandomUserPage extends StatefulWidget {
  @override
  _RandomUserPageState createState() => _RandomUserPageState();
}

class _RandomUserPageState extends State<RandomUserPage> {
  Future<RandomUser> data;
  List<Result> results;
  @override
  void initState() {
    super.initState();
    data = readData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar,
      body: _buildBody,
    );
  }

  get _buildAppBar {
    return AppBar(
      title: Text("Random User"),
      centerTitle: true,
    );
  }

  get _buildBody {
    return Container(
      alignment: Alignment.center,
      color: Colors.grey,
      child: FutureBuilder<RandomUser>(
        future: data,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print("snapshot.error : ${snapshot.error}");
            return Text("Error while reading data");
          }

          if (snapshot.connectionState == ConnectionState.done) {
            results = snapshot.data.results;
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
          data = readData();
        });
      },
      child: ListView.builder(
          itemCount: results.length,
          itemBuilder: (context, index) {
            return _buildItem(results[index]);
          }),
    );
  }

  _buildItem(Result item) {
    return Card(
      child: Slidable(
        actionPane: SlidableBehindActionPane(),
        actionExtentRatio: 0.25,
        actions: [
          IconSlideAction(
            icon: Icons.notifications_off_outlined,
            color: Colors.green,
            caption: "Mute",
            onTap: () {
              print("Mute clicked");
            },
          )
        ],
        secondaryActions: [
          IconSlideAction(
            icon: Icons.more_horiz,
            color: Colors.grey[300],
            // caption: "Mute",
            onTap: () {
              _showAlertDialog(item);
            },
          ),
          IconSlideAction(
            icon: Icons.delete,
            color: Colors.red,
            caption: "Delete",
            onTap: () {
              print("Delete clicked");
              _showAlertDialog(item);
            },
          )
        ],
        child: ListTile(
          leading: Image.network(item.picture.medium),
          title: Text("${item.name.first} ${item.name.last}"),
          subtitle: Text("${item.email}"),
          trailing: Icon(Icons.navigate_next),
          onLongPress: () {
            _showAlertDialog(item);
          },
        ),
      ),
    );
  }

  _showAlertDialog(Result item) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Options"),
            content: Container(
              height: 150,
              width: 300,
              child: Column(
                children: [
                  Card(
                    child: ListTile(
                      leading: Icon(Icons.folder_open_outlined),
                      title: Text("Open"),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => UserRandomPage()));
                      },
                    ),
                  ),
                  Card(
                    child: ListTile(
                      leading: Icon(Icons.delete),
                      title: Text("Delete"),
                      onTap: () {
                        setState(() {
                          results.remove(item);
                        });
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                ],
              ),
            ),
            actions: [
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      Navigator.of(context).pop();
                    });
                  },
                  child: Text("Cancel"))
            ],
          );
        });
  }
}
