import 'package:flutter/material.dart';
import 'package:buildabook/widgets/widget.dart';
import 'chapters.dart';
import 'contenders.dart';
import 'user.dart';

class ChapterPage extends StatelessWidget {
  static String tag = 'chapter-page';

  final Chapters chapter;

  ChapterPage(this.chapter);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(title: Text(chapter.title), appBar: AppBar()),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 10, bottom:  10.0),
              child: Center(
                child: Text("Chapter Text", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ),
            ),
            SizedBox(
              height: 425,
              width: 375,
              child: Container(
                color: Colors.grey[350],
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 1,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text(chapter.text),
                    );
                  },
                ),
              )
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ListTile(
                      leading: Icon(Icons.library_books, color: Colors.black),
                      title: Text("Contenders"),
                      trailing: Icon(Icons.keyboard_arrow_right),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => ContendersPage(chapter.contenders)));
                      },
                    ),
                  ),
                ],
              )
            ),
            SizedBox(
              height: 100,
              width: 375,
              child: Container(
                  margin: EdgeInsets.only(right: 20),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Column(
                          children: <Widget>[
                            Text("Author:", style: TextStyle(fontWeight: FontWeight.bold)),
                            Flexible(
                              child: GestureDetector(
                                child: Text(chapter.author,
                                  style: TextStyle(color: Colors.blue, decoration: TextDecoration.underline),
                                ),
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => UserPage()));
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: <Widget>[
                            Text("Upvotes:", style: TextStyle(fontWeight: FontWeight.bold)),
                            Flexible(
                              child: Text(chapter.upvoteCount.toString()),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: <Widget>[
                            Text("Date Created:", style: TextStyle(fontWeight: FontWeight.bold)),
                            Flexible(
                              child: Text(chapter.dateCreated),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
              ),
            ),
          ],
        ),
      ),
    );
  }
}