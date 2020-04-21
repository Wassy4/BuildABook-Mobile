import 'package:flutter/material.dart';
import 'package:buildabook/widgets/widget.dart';
import 'contenders.dart';
import 'user.dart';

class ContenderPage extends StatelessWidget {
  static String tag = 'contender-page';

  final Contenders contender;

  ContenderPage(this.contender);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(title: Text(contender.title), appBar: AppBar()),
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
                        title: Text(contender.text),
                      );
                    },
                  ),
                )
            ),
            SizedBox(
              height: 100,
              width: 375,
              child: Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Column(
                          children: <Widget>[
                            Text("Author:", style: TextStyle(fontWeight: FontWeight.bold)),
                            Flexible(
                              child: GestureDetector(
                                child: Text(contender.author,
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
                              child: Text(contender.upvoteCount.toString()),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: <Widget>[
                            Text("Date Created:", style: TextStyle(fontWeight: FontWeight.bold)),
                            Flexible(
                              child: Text(contender.dateCreated),
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