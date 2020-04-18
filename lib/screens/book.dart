import 'package:flutter/material.dart';
import 'package:buildabook/widgets/widget.dart';
import 'books.dart';
import 'winners.dart';
import 'contenders.dart';


class BookPage extends StatelessWidget {
  static String tag = 'book-page';

  final Books book;

  BookPage(this.book);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(title: Text(book.title), appBar: AppBar()),
      body: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(15.0),
                  child: Image.network(book.image, height: 200, width: 200),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("Author(s):", style: TextStyle(fontWeight: FontWeight.bold)),
                      for (var author in book.authorArray)
                        Text(author),
                      Padding(
                          padding: EdgeInsets.all(5.0)
                      ),
                      Text("Date Created:", style: TextStyle(fontWeight: FontWeight.bold)),
                      Text(book.dateCreated),
                      Padding(
                          padding: EdgeInsets.all(5.0)
                      ),
                      Text("Number of Chapters:", style: TextStyle(fontWeight: FontWeight.bold)),
                      Text(book.numberOfChapters.toString()),
                      Padding(
                          padding: EdgeInsets.all(5.0)
                      ),
                      Text("Views:", style: TextStyle(fontWeight: FontWeight.bold)),
                      Text(book.views.toString()),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Container(
                  width: 335,
                  margin: EdgeInsets.only(left: 15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("Writing Prompt:", style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
                      Padding(
                        padding: EdgeInsets.all(2.0),
                      ),
                      Text(book.writingPrompt),
                    ],
                  ),
                ),
              ],
            ),
          ]
        ),
      );
  }
}