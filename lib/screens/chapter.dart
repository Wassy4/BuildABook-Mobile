import 'package:flutter/material.dart';
import 'package:buildabook/widgets/widget.dart';
import 'package:buildabook/widgets/widget.dart';
import 'books.dart';
import 'winners.dart';
import 'contenders.dart';


class ChapterPage extends StatelessWidget {
  static String tag = 'chapter-page';

  final Books book;

  ChapterPage(this.book);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(title: Text('Chapter'), appBar: AppBar()),
      drawer: BaseMenu(),
        body:Column(
          children: <Widget>[
            for (int i =1; i < (book.numberOfChapters+1);i++ )
              new SizedBox(
                width: 420,
                height: 100,
                child: new RaisedButton(
                  child: Text('Chapter '+ i.toString()),
                   onPressed: (){
                     // i++;
                  } ,
                ),
              )
          ],
        ),

      );
  }

}