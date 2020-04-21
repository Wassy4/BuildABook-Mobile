import 'package:flutter/material.dart';
import 'screens/books.dart';
import 'screens/users.dart';


void main() => runApp(BuildABookApp());

class BuildABookApp extends StatelessWidget {
  final routes = <String, WidgetBuilder>{
    BooksPage.tag: (context) => BooksPage(),
    UsersPage.tag: (context) => UsersPage(),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BuildABook Reader',
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.green,
      ),
      home: BooksPage(),
      routes: routes,
    );
  }
}