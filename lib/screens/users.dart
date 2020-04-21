import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:buildabook/widgets/widget.dart';
import 'package:http/http.dart' as http;
import 'user.dart';

class UsersPage extends StatefulWidget {
  static String tag = 'users-page';
  @override
  _UsersPageState createState() => new _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: BaseAppBar(title: Text('User List'), appBar: AppBar()),
        drawer: BaseMenu(),
        body: Container(
            child: FutureBuilder<List<Users>>(
                future: fetchUsers(),
                builder: (BuildContext context, AsyncSnapshot snapshot){
                  if (snapshot.hasData){
                    return ListView.separated(
                        itemCount: snapshot.data.length,
                        separatorBuilder: (context, index) =>
                            Divider(height: 0.0, color: Colors.grey),
                        itemBuilder: (BuildContext context, int index) {
                          return ListTile(
                            title: Text(snapshot.data[index].username),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Icon(Icons.keyboard_arrow_right),
                                //Icon(Icons.remove_red_eye),
                                //Text(snapshot.data[index].views.toString()),
                                //SizedBox(width: 10),
                                //Icon(Icons.alarm),
                                //Text(snapshot.data[index].duration.toString()),
                              ],
                            ),
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => UserPage()));
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

Future<List<Users>> fetchUsers() async {
  var response = await http.get('https://buildabook.herokuapp.com/api/user/getAll');
  var jsonData = json.decode(response.body);

  List<Users> users = [];

  for (var u in jsonData){
    Users user = Users(
        u['_id'],
        u['username'],
        u['email'],
        u['password'],
    );

    users.add(user);
  }

  return users;
}

class Users {
  final String id;
  final String username;
  final String email;
  final String password;


  Users(
      this.id,
      this.username,
      this.email,
      this.password
      );
}