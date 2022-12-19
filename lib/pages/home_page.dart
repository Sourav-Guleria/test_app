import 'package:flutter/material.dart';
import 'package:test_app/services/api_model.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

 Astroid astroid = Astroid();

 initState(){
 fetchData();
  Super.initSatatef();
 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appbar : AppBar(),
      body: Column(children: [
           Container(
            child: Text("Test")
           ),
      ]),
    );
  }

//  Widget astroid(){
//  return ListView.Builder
//  }



Future<Astroid?> fetchData()  async{
 
 var responce = await http.get(Uri.parse("https://api.nasa.gov/planetary/apod?api_key=FS53o0PG6wlXsOZGIKYAUu3vaMlPNiI92TRxfghv"));
 if(responce.statusCode == 200){

  var jsonString = responce.body;
  print(responce.body);

       var decodedData = Astroid.fromJson(jsonDecode(responce.body));
      
       return decodedData;

   } else {
      print('Request failed with status: ${responce.statusCode}');
    }
    return null;
  }

}