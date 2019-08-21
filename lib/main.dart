import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

import './quiz.dart';


main() {
  runApp(MaterialApp(
    theme: ThemeData(
      primaryColor: Colors.white
     // primarySwatch: Colors.lightGreen
    ),
    home: App(),
  ));
}

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {

  Map jsonData;
  List as;
  int seconds =3;


//  List _questions = [
//    {
//      1: "where is Bhopal",
//      "Answers": [
//        {"Text": "Us", "Score": 0},
//        {"Text": "India", "Score": 5},
//        {"Text": "Russia", "Score": 0},
//        {"Text": "Iserail", "Score": 0}
//      ]
//    },
//    {
//      1: "who is the president of India",
//      "Answers": [
//        {"Text": "Tram", "Score": 0},
//        {"Text": "Modi", "Score": 5},
//        {"Text": "Vlamidin Putin", "Score": 0},
//        {"Text": "Manmohan Singh", "Score": 0}
//      ]
//    },
//    {
//      1: "whose Programming language you know most",
//      "Answers": [
//        {"Text": "C++", "Score": 0},
//        {"Text": "Java", "Score": 5},
//        {"Text": "Dart", "Score": 0},
//        {"Text": "Python", "Score": 0}
//      ]
//    },
//  ];

     Future<Map> getdata()async{
     String url= "https://opentdb.com/api.php?amount=5&category=9&difficulty=easy&type=multiple";
     final response = await http.get(url);
     var jsonData= json.decode(response.body);
       print(jsonData);
       as= jsonData['results'];
        return null;
     }

  @override
  void initState(){
    getdata();
    super.initState();
  }


  void _onLoading() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context){
        return Dialog(
          child: new Row(
            mainAxisSize: MainAxisSize.min,
            children: [
               CircularProgressIndicator(),
              Text("time left $seconds"),
            ],
          ),
        );
      },
    );
    new Future.delayed(new Duration(seconds: seconds), () {

      Navigator.push(context, MaterialPageRoute(builder: (context){
       List buttons =[
          as[0]['correct_answer'],
          //widget._questions[widget._index]["Answers"][0]["Score"],

          as[0]['incorrect_answers'][0],
          //widget._questions[widget._index]["Answers"][1]["Score"],

          as[0]['incorrect_answers'][1],
          // widget._questions[widget._index]["Answers"][2]["Score"],

          as[0]['incorrect_answers'][2],
          // widget._questions[widget._index]["Answers"][3]["Score"],

        ];
        buttons.shuffle();

        return Quiz(as,buttons);
      }));
    }
    );
  }
 
  @override
  Widget build(BuildContext context) {
   // print(as);
    return Scaffold(
        appBar: AppBar(
          title: Text("Quiz App"),
          centerTitle: true,
          backgroundColor: Theme.of(context).primaryColorLight ,
        ),
        body: Column(
          children: <Widget>[
            Text("dashboard"),
            FlatButton(onPressed:_onLoading, child: Text("submit"))
          ],
        ));
  }
}
