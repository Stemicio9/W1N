
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:w1n_client/pagine/dashboard.dart';
import 'package:w1n_client/pagine/login.dart';

void main() => runApp(App());


class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Title',
      home: LoginPage(),
      routes: <String,WidgetBuilder>{
      '/home': (BuildContext context)=> new HomePage(),
      '/login': (BuildContext context)=> new LoginPage(),
      }
    );
  }
}
