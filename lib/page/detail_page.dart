import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/item.dart';

class DetailPage extends StatefulWidget {
  final Item item;
  DetailPage({this.item});
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool _dark = false;
  bool _hide = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody,
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
        _buildListView,
      ],
    );
  }

  get _buildListView {
    return ListView.builder(
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
      itemCount: itemDetailPageList.length,
      itemBuilder: (context, index) {
        return _buildItem(itemDetailPageList[index]);
      },
    );
  }

  _buildItem(Item item) {
    return Container(
      // margin: EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width,
      height: 400,
      child: Column(
        children: [
          InkWell(
            child: _buildImage(item.img),
          ),
          _buildButtonBorder,
        ],
      ),
    );
  }

  _buildImage(String img) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              ListTile(
                leading: IconButton(
                    icon: Icon(
                      Icons.navigate_before,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    }),
                trailing: IconButton(
                    icon: Icon(
                      Icons.more_vert,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    }),
              ),
            ],
          ),
          Column(
            children: [
              Padding(padding: EdgeInsets.only(top: 80, left: 80, right: 80)),
              ListTile(
                title: IconButton(
                    icon: Icon(_hide ? Icons.pause_rounded : Icons.pause_sharp,
                        color: Colors.white),
                    iconSize: 50,
                    onPressed: () {
                      setState(() {
                        _hide = !_hide;
                      });
                    }),
                leading: IconButton(
                    icon: Icon(Icons.fast_rewind_rounded, color: Colors.white),
                    iconSize: 40,
                    onPressed: () {}),
                trailing: IconButton(
                    icon: Icon(Icons.fast_forward_rounded, color: Colors.white),
                    iconSize: 40,
                    onPressed: () {}),
              ),
            ],
          ),
        ],
      ),
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
      child: Container(
        padding: EdgeInsets.all(10),
        color: _dark ? Colors.black : Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Mix - ${widget.item.title}",
              style: TextStyle(
                color: _dark ? Colors.white : Colors.black,
              ),
            ),
            IconButton(
                icon: Icon(_hide
                    ? Icons.keyboard_arrow_up_rounded
                    : Icons.keyboard_arrow_down_rounded),
                color: _dark ? Colors.white : Colors.black,
                onPressed: () {
                  setState(() {
                    _dark = !_dark;
                    _hide = !_hide;
                  });
                }),
          ],
        ),
      ),
    );
  }
}
