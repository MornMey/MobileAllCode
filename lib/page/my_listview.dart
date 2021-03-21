import 'package:flutter/material.dart' show Alignment, AppBar, Axis, Border, BorderRadius, BouncingScrollPhysics, BoxDecoration, BoxFit, BoxShape, BuildContext, Colors, Column, Container, DecorationImage, EdgeInsets, Icon, IconButton, Icons, InkWell, ListView, MainAxisAlignment, MaterialPageRoute, MediaQuery, Navigator, NetworkImage, Radius, Row, Scaffold, State, StatefulWidget, Text, TextStyle, Widget;
import 'package:flutter_application_1/page/detail_page.dart';
import 'package:flutter_application_1/models/item.dart';
import 'package:page_transition/page_transition.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildApp,
      body: _buildBody,
    );
  }

  get _buildApp {
    return AppBar(
      backgroundColor: Colors.black87,
      centerTitle: true,
      title: Text("My ListView"),
    );
  }

  get _buildBody {
    return Container(
      color: Colors.black87,
      alignment: Alignment.centerLeft,
      child: _buildParentListViewer,
    );
  }

  get _buildParentListViewer {
    return ListView(
      children: [
        _buildStoryListView,
        _buildListView,
      ],
    );
  }

  get _buildStoryListView {
    return Container(
      height: 200,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: itemStoryList.length,
          itemBuilder: (context, index) {
            return _buildStoryItem(itemStoryList[index]);
          }),
    );
  }

  _buildStoryItem(Item item) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          PageTransition(
              child: DetailPage(
                item: item,
              ),
              type: PageTransitionType.bottomToTop),
        );
      },
      child: Container(
        margin: EdgeInsets.all(10),
        child: Container(
          width: 150,
          height: 150,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.yellow,
              image: DecorationImage(
                image: NetworkImage(item.img),
                fit: BoxFit.cover,
              ),
              border: Border.all(width: 5, color: Colors.blueGrey[700])),
        ),
      ),
    );
  }

  get _buildListView {
    return ListView.builder(
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
      itemCount: itemList.length,
      itemBuilder: (context, index) {
        return _buildItem(itemList[index]);
      },
    );
  }

  _buildItem(Item item) {
    return Container(
      margin: EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width,
      height: 400,
      child: Column(
        children: [
          _buildText(item.title),
          InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => DetailPage(
                    item: item,
                  ),
                ),
              );
            },
            child: _buildImage(item.img),
          ),
          _buildButtonBorder,
        ],
      ),
    );
  }

  _buildText(String text) {
    return Container(
      alignment: Alignment.centerLeft,
      height: 50,
      child: Text(
        text,
        style: TextStyle(fontSize: 20, color: Colors.white70),
      ),
    );
  }

  _buildImage(String img) {
    return Container(
      height: 250,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
          image: DecorationImage(
            image: NetworkImage(img),
            fit: BoxFit.cover,
          )),
    );
  }

  get _buildButtonBorder {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
      ),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Row(
                children: [
                  IconButton(
                      icon: Icon(Icons.favorite_border), onPressed: () {}),
                  IconButton(icon: Icon(Icons.book), onPressed: () {}),
                ],
              ),
            ),
            IconButton(
                icon: Icon(Icons.comment_bank_outlined), onPressed: () {})
          ],
        ),
      ),
    );
  }
}
