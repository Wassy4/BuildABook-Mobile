import 'package:flutter/material.dart';
import 'package:buildabook/widgets/widget.dart';
import 'books.dart';
import 'winners.dart';
import 'contenders.dart';


class BookPage extends StatelessWidget {
  static String tag = 'book-page';
  final BookItem book;

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
                    margin: EdgeInsets.all(25.0),
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
                        Text("John Doe"), // Replace with list
                        Text("John Smith"),
                        Padding(
                          padding: EdgeInsets.all(5.0)
                        ),
                        Text("Date Created:", style: TextStyle(fontWeight: FontWeight.bold)),
                        Text("4/20/20"),
                        Padding(
                            padding: EdgeInsets.all(5.0)
                        ),
                        Text("Expiration Date:", style: TextStyle(fontWeight: FontWeight.bold)),
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
            Row(
                children: <Widget>[
                  Container(
                    width: 335,
                    margin: EdgeInsets.only(left: 25.0),
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
            Expanded(
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 88.0),
                child:  ListView(
                  children: ListTile.divideTiles(
                    context: context,
                    tiles: [
                      Ink(
                        color: Colors.yellow,
                        child: ListTile(
                          title: Text('Chapter Winners'),
                          trailing: Icon(Icons.keyboard_arrow_right),
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => WinnersPage()));
                          },
                        ),
                      ),
                      ListTile(
                        title: Text('Current Contenders'),
                        trailing: Icon(Icons.keyboard_arrow_right),
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => ContendersPage()));
                        },
                      ),
                    ],
                  ).toList(),
                ),
              ),
            ),
          ]
        ),
      ),
    );
  }
}