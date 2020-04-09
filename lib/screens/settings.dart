import 'package:flutter/material.dart';
import 'package:buildabook/widgets/widget.dart';


class SettingsPage extends StatefulWidget {
  static String tag = 'settings-page';
  @override
  _SettingsPageState createState() => new _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(title: Text('Application Settings'), appBar: AppBar()),
      drawer: BaseMenu(),
    );
  }
}