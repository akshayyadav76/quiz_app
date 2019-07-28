import 'package:flutter/material.dart';

import './quiz.dart';

main(){
runApp(
    MaterialApp(

      home: App(),));
}

class App extends StatefulWidget{

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {

  var _index = 0;
  //int _totalScore;

 void _onPass(BuildContext context, String rightAnswer,int score){

     setState(() {
       _index = _index +1;
       //_totalScore +=score;
     });



   var alert = AlertDialog(title: Text("result"),
   content: Text('your score is $score'),
     actions: <Widget>[
       RaisedButton(
           child: Text("Ok",),
            textColor: Colors.black,
           onPressed: (){Navigator.pop(context);})],
   );

   showDialog(context: context,builder: (BuildContext context){
     return alert;
   });
 }
 
 void _reset(){
   setState(() {
     _index = 0;
   });
    
 }

  List _questions=[

      { 1: "where is Bhopal",
        "Answers": [
          {"Text": "Us",    "Score":0 },
          {"Text":"India",  "Score":5 },
          {"Text":"Russia", "Score":0 },
          {"Text":"Iserail","Score":0 }]
      },

      { 1: "who is the president of India",
        "Answers": [
          {"Text":"Tram","Score":0 },
          {"Text":"Modi","Score": 5} ,
          {"Text":"Vlamidin Putin","Score":0 },
          {"Text":"Manmohan Singh","Score":0 }]
      },

      { 1: "whose Programming language you know most",
        "Answers": [
          {"Text":"C++","Score":0 },
          {"Text":"Java","Score":0 },
          {"Text":"Dart","Score":5 },
          {"Text":"Python","Score":0 }]
      },
  ];

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text("Quiz App"),centerTitle: true,),
      body: _index < _questions.length
       ? Quiz(_onPass,_questions,_index)
       : Center(child: RaisedButton( child:Text("restart the game") , onPressed: _reset),),
    );
  }
}

