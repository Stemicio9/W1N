library librerie.authenticationutils;

import 'dart:convert';

import 'package:w1n_client/model/currentauth.dart';
import 'package:http/http.dart' as http;


String token = "";

CurrentAuth currentAuth = new CurrentAuth();

final String basepath = "http://87.27.62.247/users/";

final String basepathprofilo = "http://87.27.62.247/profilo/";

 Future<void> chisono() async{
     String urlcompleto = basepath + "user/chisono?access_token="+token;

     final response = await http.get(urlcompleto);

     final rispostajson = json.decode(response.body);

     final risultato = rispostajson['result'];

     currentAuth.nome = risultato['username'];

     final listaautorita = risultato['authorities'];



     print(listaautorita[0]['authority']);


     currentAuth.ruolo = listaautorita[0]['authority'];


 }


 Future<void> prendiprofilo() async {
   String urlcompleto = basepathprofilo + "prendiprofilo?access_token="+token;
   final response = await http.get(urlcompleto);
   final rispostajson = json.decode(response.body);

   print(rispostajson['result']['email']);

 }





