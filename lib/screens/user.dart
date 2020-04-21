import 'package:flutter/material.dart';
import 'package:buildabook/widgets/widget.dart';

class UserPage extends StatelessWidget {
  static String tag = 'user-page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(title: Text('User'), appBar: AppBar()),
      body: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 10),
            child: CircleAvatar(
              backgroundColor: Colors.grey,
              radius: 100,
            ),
          ),
          Expanded(
            child: ListView(
                children: <Widget>[
                  Card(
                    margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    color: Colors.grey[400],
                    elevation: 10,
                    child: ListTile(
                      leading: Icon(Icons.person, color: Colors.black),
                      title: Text("USERNAME HERE"),
                    ),
                  ),
                  Card(
                    margin: EdgeInsets.symmetric(horizontal: 20.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    color: Colors.grey[200],
                    elevation: 10,
                    child: ListTile(
                      leading: Icon(Icons.email, color: Colors.black),
                      title: Text("EMAIL HERE"),
                    ),
                  )
                ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10, bottom:  10.0),
            child: Text("Contributions", style: TextStyle(fontSize: 18)),
          ),
          SizedBox(
              height: 200,
              width: 375,
              child: Container(
                color: Colors.grey[350],
                child: ListView.separated(
                  shrinkWrap: true,
                  itemCount: 1,
                  separatorBuilder: (context, index) =>
                      Divider(height: 0.0, color: Colors.black),
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text("CONTRIBUTIONS HERE"),
                    );
                  },
                ),
              )
          ),
          Container(
            margin: EdgeInsets.only(top: 10, bottom:  10.0),
          ),
        ],
      ),
    );
  }
}