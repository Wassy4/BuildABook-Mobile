import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:buildabook/widgets/widget.dart';
import 'package:http/http.dart' as http;
import 'book.dart';

class BooksPage extends StatefulWidget {
  static String tag = 'books-page';
  @override
  _BooksPageState createState() => new _BooksPageState();
}

class _BooksPageState extends State<BooksPage> {
  Future<List<BookItem>> _getBooks() async {
    var data = await http.get('https://next.json-generator.com/api/json/get/NkhgQltwd');
    var jsonData = json.decode(data.body);

    List<BookItem> books = [];

    for (var b in jsonData){
      BookItem book = BookItem(
          b['_id'],
          b['title'],
          b['writingPrompt'],
          b['image'],
          b['chaptersArray'],
          b['numberOfChapters'],
          b['dateCreated'],
          b['views'],
          b['authorArray'],
          b['inProgress'],
          b['comments'],
          b['isPremium'],
          b['experationDate'],
          b['duration'],
          b['genre']);

      books.add(book);
    }

    return books;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: BaseAppBar(title: Text('BuildABook'), appBar: AppBar()),
        drawer: BaseMenu(),
        body: Container(
            child: FutureBuilder(
                future: _getBooks(),
                builder: (BuildContext context, AsyncSnapshot snapshot){
                  if (snapshot.data == null){
                    return Container(
                        child: Center(
                            child: Text('Loading...')
                        )
                    );
                  }
                  else {
                    return ListView.separated(
                        itemCount: snapshot.data.length,
                        separatorBuilder: (context, index) =>
                            Divider(height: 0.0, color: Colors.grey),
                        itemBuilder: (BuildContext context, int index) {
                          return ListTile(
                            leading: Image.network(snapshot.data[index].image),
                            title: Text(snapshot.data[index].title),
                            subtitle: Text(snapshot.data[index].genre),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Icon(Icons.remove_red_eye),
                                Text(snapshot.data[index].views.toString()),
                                SizedBox(width: 10),
                                Icon(Icons.alarm),
                                Text(snapshot.data[index].duration),
                              ],
                            ),
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => BookPage(snapshot.data[index])));
                            },
                          );
                        }
                    );
                  }
                }
            )
        )
    );
  }
}

class BookItem {
  final bool inProgress;
  final bool isPremium;
  final int authorArray;
  final int chaptersArray;
  final int id;
  final int numberOfChapters;
  final int views;
  final String comments;
  final String dateCreated;
  final String duration;
  final String expirationDate;
  final String image;
  final String genre;
  final String title;
  final String writingPrompt;

  BookItem(
      this.id,
      this.title,
      this.writingPrompt,
      this.image,
      this.chaptersArray,
      this.numberOfChapters,
      this.dateCreated,
      this.views,
      this.authorArray,
      this.inProgress,
      this.comments,
      this.isPremium,
      this.expirationDate,
      this.duration,
      this.genre
      );
}