


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:w1n_client/librerie/athenticationutils.dart' as globalauth;

class HomePage extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
      return new DefaultTabController(
        length: 5,
        child: Scaffold(
          bottomNavigationBar: Container(
            color: Color(0xFF3F5AA6),
          child: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.directions_car)),
              Tab(icon: Icon(Icons.directions_transit)),
              Tab(icon: Icon(Icons.directions_bike)),
              Tab(icon: Icon(Icons.directions_bike)),
              Tab(icon: Icon(Icons.person)),
            ],
           ),
          ),
          appBar: AppBar(
            title: Text("Ciao " + globalauth.currentAuth.nome),
          ),
          body: TabBarView(
            children: [
              Icon(Icons.directions_car),
              Icon(Icons.directions_transit),
              Icon(Icons.directions_bike),
              Icon(Icons.directions_bike),
              Icon(Icons.person),
            ],
          ),
        ),
      );
  }



}