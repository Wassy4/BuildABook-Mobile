import 'package:flutter/material.dart';


class BooksPage extends StatefulWidget {
  static String tag = 'books-page';
  @override
  _BooksPageState createState() => new _BooksPageState();
}

class _BooksPageState extends State<BooksPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BuildABook'),
      ),
    );
  }
}