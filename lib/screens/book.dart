import 'package:flutter/material.dart';
import 'package:buildabook/widgets/widget.dart';
import 'books.dart';


class BookPage extends StatelessWidget {
  static String tag = 'book-page';
  final BookItem book;

  BookPage(this.book);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(title: Text(book.title), appBar: AppBar()),
      drawer: BaseMenu(),
      body: Container(
        child: Column(
          children: <Widget>[
            Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(20.0),
                    child: Image.network(book.image),
                  ),
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("Genre:", style: TextStyle(fontWeight: FontWeight.bold)),
                        Text(book.genre),
                        Padding(
                            padding: EdgeInsets.all(5.0)
                        ),
                        Text("Author(s):", style: TextStyle(fontWeight: FontWeight.bold)),
                        Text("John Smith, John Smith"), // Replace with list
                        Padding(
                          padding: EdgeInsets.all(5.0)
                        ),
                        Text("Date Created:", style: TextStyle(fontWeight: FontWeight.bold)),
                        Text("4/20/20"),
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
          ],
        ),
      ),
    );
  }
}