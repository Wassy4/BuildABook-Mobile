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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(title: Text('BuildABook Reader'), appBar: AppBar()),
      drawer: BaseMenu(),
      body: Container(
        child: FutureBuilder<List<Books>>(
          future: fetchBooks(),
          builder: (BuildContext context, AsyncSnapshot snapshot){
            if (snapshot.hasData){
              return ListView.separated(
                  itemCount: snapshot.data.length,
                  separatorBuilder: (context, index) =>
                      Divider(height: 0.0, color: Colors.grey),
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      leading: ConstrainedBox(
                        constraints: BoxConstraints(
                          minHeight: 60,
                          minWidth: 60,
                          maxHeight: 60,
                          maxWidth: 60,
                        ),
                        child: Image.network(snapshot.data[index].image),
                      ),
                      title: Text(snapshot.data[index].title),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Icon(Icons.keyboard_arrow_right),
                          //Icon(Icons.remove_red_eye),
                          //Text(snapshot.data[index].views.toString()),
                          //SizedBox(width: 10),
                          //Icon(Icons.alarm),
                          //Text(snapshot.data[index].duration.toString()),
                      ],
                      ),
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => BookPage(snapshot.data[index])));
                      },
                    );
                  }
              );
            }
            else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            else {
              return Container(
                  child: Center(
                      child: Text('Loading...')
                  )
              );
            }
          }
        )
      )
    );
  }
}

Future<List<Books>> fetchBooks() async {
  var response = await http.get('https://buildabook.herokuapp.com/api/book/getAll');
  var jsonData = json.decode(response.body);

  List<Books> books = [];

  for (var b in jsonData){
    Books book = Books(
        b['_id'],
        b['views'],
        b['authorArray'],
        b['inProgressFlag'],
        b['duration'],
        b['title'],
        b['writingPrompt'],
        b['image'],
        b['chaptersArray'],
        b['numberOfChapters'],
        b['dateCreated']
    );

    books.add(book);
  }

  return books;
}

class Books {
  final bool inProgressFlag;
  final int numberOfChapters;
  final int views;
  final String id;
  final List<dynamic> authorArray;
  final List<dynamic> chaptersArray;
  final int duration;
  final String title;
  final String writingPrompt;
  final String image;
  final String dateCreated;


  Books(
    this.id,
    this.views,
    this.authorArray,
    this.inProgressFlag,
    this.duration,
    this.title,
    this.writingPrompt,
    this.image,
    this.chaptersArray,
    this.numberOfChapters,
    this.dateCreated
  );
}