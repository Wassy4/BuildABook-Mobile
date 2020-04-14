import 'package:flutter/material.dart';
import 'package:buildabook/widgets/widget.dart';


class ContendersPage extends StatefulWidget {
  static String tag = 'contenders-page';
  @override
  _ContendersPageState createState() => new _ContendersPageState();
}

class _ContendersPageState extends State<ContendersPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(title: Text('Current Contenders'), appBar: AppBar()),
    );
  }
}