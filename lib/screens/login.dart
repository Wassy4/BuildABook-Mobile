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


