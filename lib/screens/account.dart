import 'package:flutter/material.dart';
import 'package:buildabook/widgets/widget.dart';


class AccountPage extends StatefulWidget {
  static String tag = 'account-page';
  @override
  _AccountPageState createState() => new _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(title: Text('My Account'), appBar: AppBar()),
      drawer: BaseMenu(),
      body: Column(
        children: <Widget>[
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              margin: EdgeInsets.only(top: 20.0),
              child: CircleAvatar(
                backgroundColor: Colors.grey,
                foregroundColor: Colors.black,
                radius: 100.0,
                child: Text('Image'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}