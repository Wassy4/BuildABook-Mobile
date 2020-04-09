import 'package:buildabook/screens/account.dart';
import 'package:buildabook/screens/books.dart';
import 'package:buildabook/screens/settings.dart';
import 'package:flutter/material.dart';


class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Color backgroundColor = Colors.lightGreen;
  final Text title;
  final AppBar appBar;

  const BaseAppBar({Key key, this.title, this.appBar})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title,
      backgroundColor: backgroundColor,
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
              leading: Icon(Icons.home),
              title: Text('Home'),
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
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Application Settings'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SettingsPage()),
                );
              },
            ),
          ],
        )
    );
  }
}