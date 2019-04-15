

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:oauth2/oauth2.dart' as oauth2;
import 'package:w1n_client/librerie/athenticationutils.dart' as globalauth;

class LoginPage extends StatefulWidget {

  @override
  LoginStatePage createState() {
    return LoginStatePage();
  }


}


class LoginStatePage extends State<LoginPage>{

  TextEditingController usernamet = new TextEditingController();
  TextEditingController passwordt = new TextEditingController();
  String msg='';


  void _login() async {



    final authorizationEndpoint =
    Uri.parse("http://87.27.62.247/oauth/token");

    final username = usernamet.text;
    final password = passwordt.text;

    // Something like this
    final identifier = "admin";
    final secret = "ciao";

    // Make a request to the authorization endpoint that will produce the fully
    // authenticated Client.
    var client = await oauth2.resourceOwnerPasswordGrant(
        authorizationEndpoint, username, password,
        identifier: identifier, secret: secret);

    if (client.credentials.accessToken != null){
      globalauth.token = client.credentials.accessToken;

      await globalauth.chisono();

      await globalauth.prendiprofilo();

      Navigator.pushReplacementNamed(context, '/home');


    }

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login"),),
      body: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              Text("Username",style: TextStyle(fontSize: 18.0),),
              TextField(
                controller: usernamet,
                decoration: InputDecoration(
                    hintText: 'Username'
                ),
              ),
              Text("Password",style: TextStyle(fontSize: 18.0),),
              TextField(
                controller: passwordt,
                obscureText: true,
                decoration: InputDecoration(
                    hintText: 'Password'
                ),
              ),

              RaisedButton(
                child: Text("Login"),
                onPressed: (){
                  _login();
//                  Navigator.pop(context);
                },
              ),

              Text(msg,style: TextStyle(fontSize: 20.0,color: Colors.red),)


            ],
          ),
        ),
      ),
    );
  }


}