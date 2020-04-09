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
    );
  }
}