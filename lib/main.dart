import 'package:buildabook/screens/settings.dart';
import 'package:flutter/material.dart';
import 'screens/account.dart';
import 'screens/book.dart';
import 'screens/books.dart';
import 'screens/chapter.dart';
import 'screens/login.dart';
import 'screens/signup.dart';
import 'screens/user.dart';


void main() => runApp(BuildABookApp());

class BuildABookApp extends StatelessWidget {
  final routes = <String, WidgetBuilder>{
    AccountPage.tag: (context) => AccountPage(),
    BookPage.tag: (context) => BookPage(),
    BooksPage.tag: (context) => BooksPage(),
    ChapterPage.tag: (context) => ChapterPage(),
    LoginPage.tag: (context) => LoginPage(),
    SettingsPage.tag: (context) => SettingsPage(),
    SignupPage.tag: (context) => SignupPage(),
    UserPage.tag: (context) => UserPage(),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BuildABook',
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.lightGreen,
        fontFamily: 'Nunito',
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.lightGreen,
        fontFamily: 'Nunito',
      ),
      home: BooksPage(),
      routes: routes,
    );
  }
}