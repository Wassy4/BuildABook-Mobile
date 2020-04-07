import 'package:flutter/material.dart';


class AccountPage extends StatefulWidget {
  static String tag = 'account-page';
  @override
  _AccountPageState createState() => new _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BuildABook'),
      ),
    );
  }
}