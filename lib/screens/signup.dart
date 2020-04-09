import 'package:flutter/material.dart';
import 'package:buildabook/widgets/widget.dart';

class SignupPage extends StatefulWidget {
  static String tag = 'signup-page';
  @override
  _SignupPageState createState() => new _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(title: Text('Signup'), appBar: AppBar()),
      drawer: BaseMenu(),
    );
  }
}