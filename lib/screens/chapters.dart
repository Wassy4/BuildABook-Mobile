import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:buildabook/widgets/widget.dart';
import 'package:http/http.dart' as http;
import 'chapter.dart';

class ChaptersPage extends StatelessWidget {
  static String tag = 'chapters-page';

  final List<dynamic> chaptersArray;

  ChaptersPage(this.chaptersArray);

  Future<List<Chapters>> fetchChapters() async {
    var response = await http.get('https://buildabook.herokuapp.com/api/chapter/getAll');
    var jsonData = json.decode(response.body);

    List<Chapters> chapters = [];

    for (var c in jsonData) {
      Chapters chapter = Chapters(
          c['_id'],
          c['title'],
          c['text'],
          c['author'],
          c['expirationDate'],
          c['startDate'],
          c['upvoteCount'],
          c['inProgressFlag'],
          c['dateCreated'],
          c['contenders']
      );

      for (var id in chaptersArray) {
        if (chapter.id == id && chapter.title != '') {
          chapters.add(chapter);
        }
      }
    }

    if (chapters == null) {
        print("Chapters null");
      }

    return chapters;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: BaseAppBar(title: Text('Table of Contents'), appBar: AppBar()),
        //drawer: BaseMenu(),
        body: Container(
            child: FutureBuilder<List<Chapters>>(
                future: fetchChapters(),
                builder: (BuildContext context, AsyncSnapshot snapshot){
                  if (snapshot.hasData){
                    return ListView.separated(
                        itemCount: snapshot.data.length,
                        separatorBuilder: (context, index) =>
                            Divider(height: 0.0, color: Colors.grey),
                        itemBuilder: (BuildContext context, int index) {
                          return ListTile(
                            title: Text(snapshot.data[index].title),
                            trailing: Icon(Icons.keyboard_arrow_right),
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => ChapterPage(snapshot.data[index])));
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


class Chapters {
  final String id;
  final String title;
  final String text;
  final String author;
  final String expirationDate;
  final String startDate;
  final int upvoteCount;
  final bool inProgressFlag;
  final String dateCreated;
  final List<dynamic> contenders;



  Chapters(
      this.id,
      this.title,
      this.text,
      this.author,
      this.expirationDate,
      this.startDate,
      this.upvoteCount,
      this.inProgressFlag,
      this.dateCreated,
      this.contenders
      );
}