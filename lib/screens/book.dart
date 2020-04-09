import 'package:flutter/material.dart';
import 'package:buildabook/widgets/widget.dart';


class BookPage extends StatefulWidget {
  static String tag = 'books-page';
  @override
  _BookPageState createState() => new _BookPageState();
}

class _BookPageState extends State<BookPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(title: Text('Book'), appBar: AppBar()),
      drawer: BaseMenu(),
    );
  }
}