import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:buildabook/widgets/widget.dart';
import 'package:http/http.dart' as http;
import 'contender.dart';

class ContendersPage extends StatelessWidget {
  static String tag = 'contenders-page';

  final List<dynamic> contenders;

  ContendersPage(this.contenders);

  Future<List<Contenders>> fetchContenders() async {
    var response = await http.get('https://buildabook.herokuapp.com/api/chapter/getAll');
    var jsonData = json.decode(response.body);

    List<Contenders> contenders1 = [];

    for (var c in jsonData) {
      Contenders contender = Contenders(
        c['_id'],
        c['title'],
        c['text'],
        c['author'],
        c['expirationDate'],
        c['startDate'],
        c['upvoteCount'],
        c['inProgressFlag'],
        c['dateCreated'],
      );

      for (var id in contenders) {
        if (contender.id == id && contender.title != '') {
          contenders1.add(contender);
        }
      }
    }

    return contenders1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: BaseAppBar(title: Text('Contenders'), appBar: AppBar()),
        //drawer: BaseMenu(),
        body: Container(
            child: FutureBuilder<List<Contenders>>(
                future: fetchContenders(),
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
                              Navigator.push(context, MaterialPageRoute(builder: (context) => ContenderPage(snapshot.data[index])));
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

class Contenders {
  final String id;
  final String title;
  final String text;
  final String author;
  final String expirationDate;
  final String startDate;
  final int upvoteCount;
  final bool inProgressFlag;
  final String dateCreated;



  Contenders(
      this.id,
      this.title,
      this.text,
      this.author,
      this.expirationDate,
      this.startDate,
      this.upvoteCount,
      this.inProgressFlag,
      this.dateCreated,
      );
}