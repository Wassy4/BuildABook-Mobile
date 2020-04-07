import 'package:flutter/material.dart';


class UserPage extends StatefulWidget {
  static String tag = 'user-page';
  @override
  _UserPageState createState() => new _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BuildABook'),
      ),
    );
  }
}