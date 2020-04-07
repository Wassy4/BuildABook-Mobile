import 'package:flutter/material.dart';


class BookPage extends StatefulWidget {
  static String tag = 'books-page';
  @override
  _BookPageState createState() => new _BookPageState();
}

class _BookPageState extends State<BookPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BuildABook'),
      ),
    );
  }
}