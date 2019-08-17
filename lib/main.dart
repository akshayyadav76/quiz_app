import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

import './quiz.dart';
import './quiz_data.dart';
import './quiz_activity.dart';


main() {
  runApp(MaterialApp(
    theme: ThemeData(
      primarySwatch: Colors.green,
    ),
    home: App(),
  ));
}

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {

  List see = data;


  List _questions = [
    {
      1: "where is Bhopal",
      "Answers": [
        {"Text": "Us", "Score": 0},
        {"Text": "India", "Score": 5},
        {"Text": "Russia", "Score": 0},
        {"Text": "Iserail", "Score": 0}
      ]
    },
    {
      1: "who is the president of India",
      "Answers": [
        {"Text": "Tram", "Score": 0},
        {"Text": "Modi", "Score": 5},
        {"Text": "Vlamidin Putin", "Score": 0},
        {"Text": "Manmohan Singh", "Score": 0}
      ]
    },
    {
      1: "whose Programming language you know most",
      "Answers": [
        {"Text": "C++", "Score": 0},
        {"Text": "Java", "Score": 5},
        {"Text": "Dart", "Score": 0},
        {"Text": "Python", "Score": 0}
      ]
    },
  ];

    Map jsonData;
    List as;

     Future<Map> getdata()async{
     String url= "https://opentdb.com/api.php?amount=15&category=9&difficulty=easy&type=multiple";
     final response = await http.get(url);
     var jsonData= json.decode(response.body);
    // print(response.body);

        as= jsonData['results'];


     }

  @override
  void initState(){
    getdata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text("Quiz App"),
          centerTitle: true,
        ),
        body: Column(
          children: <Widget>[
            Text("dashboard"),
            FlatButton(onPressed: () {
             Navigator.push(context, MaterialPageRoute(builder: (context){
               return QuizActivity(_questions,jsonData,as);
             }));
            }, child: Text("submit"))
          ],
        ));
  }
}
