import 'package:flutter/material.dart';


class ChapterPage extends StatefulWidget {
  static String tag = 'chapter-page';
  @override
  _ChapterPageState createState() => new _ChapterPageState();
}

class _ChapterPageState extends State<ChapterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BuildABook'),
      ),
    );
  }
}