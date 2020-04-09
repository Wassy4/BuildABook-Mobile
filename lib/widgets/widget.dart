import 'package:buildabook/screens/account.dart';
import 'package:buildabook/screens/books.dart';
import 'package:flutter/material.dart';


class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Text title;
  final AppBar appBar;

  const BaseAppBar({Key key, this.title, this.appBar})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title,
    );
  }

  @override
  Size get preferredSize => new Size.fromHeight(appBar.preferredSize.height);
}

class BaseMenu extends StatelessWidget {
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Container(
              height: 88.0,
              child: DrawerHeader(
                child: Text('BuildABook', style: TextStyle(fontSize: 20)),
                decoration: BoxDecoration(
                  color: Colors.lightGreen,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.book),
              title: Text('Books'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => BooksPage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.account_box),
              title: Text('My Account'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AccountPage()),
                );
              },
            ),
          ],
        )
    );
  }
}