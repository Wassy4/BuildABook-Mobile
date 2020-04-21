import 'package:flutter/material.dart';
import 'package:buildabook/widgets/widget.dart';
import 'books.dart';
import 'chapters.dart';
import 'user.dart';

class BookPage extends StatelessWidget {
  static String tag = 'book-page';

  final Books book;

  BookPage(this.book);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(title: Text(book.title), appBar: AppBar()),
      body: Container(
        child: Column(
          children: <Widget>[
            Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(15.0),
                    child: Image.network(book.image, height: 200, width: 200),
                  ),
                  Flexible(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("Author(s):", style: TextStyle(fontWeight: FontWeight.bold)),
                        for (var author in book.authorArray)
                          GestureDetector(
                            child: Text(author,
                              style: TextStyle(color: Colors.blue, decoration: TextDecoration.underline),
                            ),
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => UserPage()));
                            },
                          ),
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
            Container(
              margin: EdgeInsets.symmetric(vertical: 100.0),
              width: 250,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                color: Colors.grey,
                elevation: 10,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ListTile(
                      title: Text('Read Chapters', style: TextStyle(fontWeight: FontWeight.bold)),
                      trailing: Icon(Icons.keyboard_arrow_right),
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => ChaptersPage(book.chaptersArray)));
                      },
                    ),
                  ],
                ),
              ),
            ),
          ]
        ),
      ),
    );
  }
}



