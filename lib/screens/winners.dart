import 'package:flutter/material.dart';
import 'package:buildabook/widgets/widget.dart';


class WinnersPage extends StatefulWidget {
  static String tag = 'winners-page';
  @override
  _WinnersPageState createState() => new _WinnersPageState();
}

class _WinnersPageState extends State<WinnersPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(title: Text('Chapter Winners'), appBar: AppBar()),
    );
  }
}