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
    SignupPage.tag: (context) => SignupPage(),
    UserPage.tag: (context) => UserPage(),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BuildABook',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.lightGreen,
      ),
      home: BooksPage(),
      routes: routes,
    );
  }
}