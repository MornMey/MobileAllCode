import 'package:flutter/material.dart';

class DetailUserrandom extends StatefulWidget {
  @override
  _DetailUserrandomState createState() => _DetailUserrandomState();
}

class _DetailUserrandomState extends State<DetailUserrandom> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody,
    );
  }

  get _buildBody {
    return Container(
        padding: EdgeInsets.only(top: 10),
        child: ListView(
          children: [
            _buildIcon,
            _buildProfile,
            _buildContactMore,
            Divider(),
            _buildContactNumber,
            Divider(),
            _buildFromUser,
            Divider(),
          ],
        ));
  }

  get _buildIcon {
    return Container(
        padding: EdgeInsets.only(top: 10),
        child: Column(
          children: [
            ListTile(
              leading: IconButton(
                  icon: Icon(
                    Icons.navigate_before,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    setState(() {
                      Navigator.of(context).pop();
                    });
                  }),
              trailing: IconButton(
                  icon: Icon(
                    Icons.more_vert,
                    color: Colors.black,
                  ),
                  onPressed: () {}),
            ),
          ],
        ));
  }

  get _buildProfile {
    return Container(
      child: Column(
        children: [
          Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.yellow,
                image: DecorationImage(
                  image: NetworkImage(
                      'https://randomuser.me/api/portraits/men/49.jpg'),
                  fit: BoxFit.cover,
                ),
                border: Border.all(width: 5, color: Colors.blueGrey[700])),
          ),
          Container(
            padding: EdgeInsets.only(top: 20),
            child: Text(
              "Nihal Balcı",
              style: TextStyle(color: Colors.black),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 10),
            child: Text(
              "nihal.balci@example.com",
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }

  get _buildContactMore {
    return Container(
      padding: EdgeInsets.only(top: 20, bottom: 20),
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
                radius: 35,
                backgroundColor: Colors.black12,
                child: Center(
                    child: Icon(
                  Icons.call,
                  color: Colors.black,
                ))),
            title: CircleAvatar(
                radius: 35,
                backgroundColor: Colors.black12,
                child: Center(
                    child: Icon(
                  Icons.message,
                  color: Colors.black,
                ))),
            trailing: CircleAvatar(
                radius: 35,
                backgroundColor: Colors.black12,
                child: Center(
                    child: Icon(
                  Icons.video_call,
                  color: Colors.black,
                ))),
          )
        ],
      ),
    );
  }

  get _buildContactNumber {
    return Container(
      child: Column(
        children: [
          ListTile(
            leading: Icon(
              Icons.call,
              color: Colors.black,
            ),
            title: Text("+(580)-780-0712"),
            subtitle: Text("Mobile | Ankara"),
            trailing: CircleAvatar(
                radius: 35,
                backgroundColor: Colors.black12,
                child: Center(
                    child: Icon(
                  Icons.message,
                  color: Colors.black,
                ))),
          )
        ],
      ),
    );
  }

  get _buildFromUser {
    return Container(
      child: Column(
        children: [
          ListTile(
            title: Text("silverbird193"),
            subtitle: Text("Username"),
            trailing: Icon(
                  Icons.navigate_next,
                  color: Colors.black,
                ),
          ),
          Divider(),
          ListTile(
            title: Text("*****"),
            subtitle: Text("Password"),
            trailing: Icon(
                  Icons.navigate_next,
                  color: Colors.black,
                ),
          ),
          Divider(),
          ListTile(
            title: Text("Ankara"),
            subtitle: Text("City"),
            trailing: Icon(
                  Icons.navigate_next,
                  color: Colors.black,
                ),
          ),
          Divider(),
          ListTile(
            title: Text("95828"),
            subtitle: Text("PostCode"),
            trailing: Icon(
                  Icons.navigate_next,
                  color: Colors.black,
                ),
          ),
        ],
      ),
    );
  }
}
