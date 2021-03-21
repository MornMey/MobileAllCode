import 'package:flutter/material.dart';

class UserRandomPage extends StatefulWidget {
  @override
  _UserRandomPageState createState() => _UserRandomPageState();
}

class _UserRandomPageState extends State<UserRandomPage> {
  // bool _hide = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody,
    );
  }

  get _buildBody {
    return Container(
      child: ListView(
        children: [
          _buildText,
          _buildAdd,
          _buildSearch,
          _buildFromUser,
        ],
      ),
    );
  }

  get _buildText {
    return Container(
      padding: EdgeInsets.only(top: 30),
      child: Column(
        children: [
          Text(
            "Create a group",
            style: TextStyle(fontSize: 25, color: Colors.blue),
          ),
        ],
      ),
    );
  }

  get _buildAdd {
    return Container(
      padding: EdgeInsets.only(top: 40),
      child: Column(
        children: [
          ListTile(
            leading:
                IconButton(icon: Icon(Icons.add_a_photo), onPressed: () {}),
            title: Text("Name your group"),
          ),
          Divider(
            color: Colors.blue,
          ),
        ],
      ),
    );
  }

  get _buildSearch {
    return Container(
      margin: EdgeInsets.all(15),
      child: Material(
        elevation: 0.2,
        borderRadius: BorderRadius.circular(10.0),
        child: TextFormField(
          cursorColor: Colors.grey,
          decoration: InputDecoration(
              fillColor: Colors.lightBlue[100],
              filled: true,
              contentPadding: EdgeInsets.only(left: 20),
              suffixIcon: IconButton(
                icon: Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
                onPressed: () {},
              ),
              hintText: "Search for people to add",
              hintStyle: TextStyle(
                fontSize: 14.0,
                color: Colors.grey,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(0),
                borderSide: BorderSide.none,
              )),
        ),
      ),
    );
  }

  get _buildFromUser {
    return Container(
      padding: EdgeInsets.only(top: 20),
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
                radius: 35,
                backgroundColor: Colors.black12,
                child: Center(
                    child: Image.network(
                  'https://randomuser.me/api/portraits/women/56.jpg',
                  fit: BoxFit.fill,
                ))),
            title: Text("Sarah Osullivan"),
            trailing: CircleAvatar(
                radius: 35,
                backgroundColor: Colors.black12,
                child: Center(
                    child: Icon(
                  Icons.add,
                  color: Colors.black,
                ))),
          ),
          Divider(),
          ListTile(
            leading: CircleAvatar(
                radius: 35,
                backgroundColor: Colors.black12,
                child: Center(
                    child: Image.network(
                  'https://randomuser.me/api/portraits/women/79.jpg',
                  fit: BoxFit.fill,
                ))),
            title: Text("Phoebe Jackson"),
            trailing: CircleAvatar(
                radius: 35,
                backgroundColor: Colors.black12,
                child: Center(
                    child: Icon(
                  Icons.add,
                  color: Colors.black,
                ))),
          ),
          Divider(),
          ListTile(
            leading: CircleAvatar(
                radius: 35,
                backgroundColor: Colors.black12,
                child: Center(
                    child: Image.network(
                  'https://randomuser.me/api/portraits/women/86.jpg',
                  fit: BoxFit.fill,
                ))),
            title: Text("Emma Gray"),
            trailing: CircleAvatar(
                radius: 35,
                backgroundColor: Colors.black12,
                child: Center(
                    child: Icon(
                  Icons.add,
                  color: Colors.black,
                ))),
          ),
          Divider(),
          ListTile(
            leading: CircleAvatar(
                radius: 35,
                backgroundColor: Colors.black12,
                child: Center(
                    child: Image.network(
                  'https://randomuser.me/api/portraits/women/70.jpg',
                  fit: BoxFit.fill,
                ))),
            title: Text("Janet Alexander"),
            trailing: CircleAvatar(
                radius: 35,
                backgroundColor: Colors.black12,
                child: Center(
                    child: Icon(
                  Icons.add,
                  color: Colors.black,
                ))),
          ),
        ],
      ),
    );
  }
}
