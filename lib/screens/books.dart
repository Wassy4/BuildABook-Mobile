import 'package:flutter/material.dart';
import 'package:buildabook/widgets/widget.dart';


class BooksPage extends StatefulWidget {
  static String tag = 'books-page';
  @override
  _BooksPageState createState() => new _BooksPageState();
}

class _BooksPageState extends State<BooksPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(title: Text('Books'), appBar: AppBar()),
      drawer: BaseMenu(),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              child: ListView.separated(
                  itemCount: 20,
                  separatorBuilder: (context, index) => Divider(height: 0.0, color: Colors.grey),
                  itemBuilder: (context, index) {
                    return ListTile(
                        leading: Icon(Icons.book),
                        title: Text('Title'),
                        subtitle: Text('Genre'),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Icon(Icons.arrow_upward),
                            Text("Upvotes"),
                            SizedBox(width: 20),
                            Icon(Icons.alarm),
                            Text("Time Left")
                          ],
                        )
                    );
                  }
              ),
            ),
          ),
        ],
      ),
    );
  }
}