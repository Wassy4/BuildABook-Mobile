/*<<<<<<< HEAD
import 'package:buildabook/screens/books.dart';
import 'package:flutter/material.dart';
import 'package:buildabook/widgets/widget.dart';

class LoginPage extends StatefulWidget {
  static String tag = 'login-page';
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: BaseAppBar(title: Text('Login'), appBar: AppBar()),
        drawer: BaseMenu(),
        body: Padding(
            padding: EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'BuildABook',
                      style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.w500,
                          fontSize: 30),
                    )
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email',
                    ),
                  ),
                ),
                Container(
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: Column(
                    children: <Widget>[
                      TextField(
                        obscureText: true,
                        controller: passwordController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Password',
                          suffixIcon: FlatButton(
                            onPressed: (){
                              //forgot password screen
                            },
                            textColor: Colors.green,
                            child: Text('Forgot Password'),
                          )
                          ),
                        ),
                    ],
                  )
                ),
                Container(
                    height: 70,
                    padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
                    child: RaisedButton(
                      textColor: Colors.white,
                      color: Colors.green,
                      child: Text('Login'),
                      onPressed: () {
                        print(nameController.text);
                        print(passwordController.text);
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => BooksPage()),
                        );
                      },
                    )
                ),
                Container(
                    child: Row(
                      children: <Widget>[
                        Text('New user?'),
                        FlatButton(
                          textColor: Colors.green,
                          child: Text(
                            'Sign up here',
                            style: TextStyle(fontSize: 15),
                          ),
                          onPressed: () {
                            //signup screen
                          },
                        )
                      ],
                      mainAxisAlignment: MainAxisAlignment.center,
                    )
                )
              ],
            )
        )
    );
  }
}*/
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  home: Login(),
));

class Login extends StatelessWidget{
  String _email,_password;
  final GlobalKey<FormState> _formKey =GlobalKey<FormState>();


  @override
  Widget build(BuildContext)
  {
    return  Scaffold(

      appBar: AppBar(
        title: Text('Build A Book'),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),

      body: Form(
         key: _formKey,
        child: Column(
          children: <Widget>[
            //USERNAME
              TextFormField(
                style: TextStyle(
                  fontSize: 20,
                ),
                // ignore: missing_return
                validator: (input){
                  if(input.isEmpty)
                    {
                      // ignore: missing_return
                      return 'enter your username';
                    }
                },
                onSaved: (input)=> _email = input,
                decoration: InputDecoration(
                 labelText: 'USERNAME'

                ),
              ),
            // PASSWORD BOX
            TextFormField(
              style: TextStyle(
                fontSize: 20,
              ),

              // ignore: missing_return
              validator: (input){
                if(input.isEmpty)
                {
                  // ignore: missing_return
                  return 'enter your Password';
                }
              },
              onSaved: (input)=> _password = input,
              decoration: InputDecoration(
                  labelText: 'PASSWORD'
              ),
                obscureText: true,
              ),
            RaisedButton(
              onPressed: (){

              } ,
              child: Text('Log in'),
            ),
          ],
        ),

      ),
    );
  }
}

  /* // API work
  void login(){
    final formState = _formKey.currentState;
    if(formState. validate())
      {

      }



  }
}}
*/