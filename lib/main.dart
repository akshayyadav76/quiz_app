import 'package:flutter/material.dart';

import './questions.dart';
import './answer.dart';

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

 void _onPass(BuildContext context, String rightAnswer){

     setState(() {
       _index = _index +1;
     });

   var alert = AlertDialog(title: Text("result"),
   content: _questions[_index][1] =="Modi"? Text("your anwser is wrong"):Text('rith'),
     actions: <Widget>[
       RaisedButton(
           child: Text("Ok",),
            textColor: Colors.black,
           onPressed: (){Navigator.of(context).pop();})],
   );

   showDialog(context: context,builder: (BuildContext context){
     return alert;
   });
 }
  List _questions=[

      { 1: "where is Bhopal",
        "Answers": ["Us","India","Russia","Iserail"]
      },

      { 1: "who is the president of India",
        "Answers": ["Tram","Modi","Vlamidin Putin","Manmohan Singh"]
      },

      { 1: "whose Programming language you know most",
        "Answers": ["C++","Java","Dart","Python"]
      },
  ];

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text("Quiz App"),centerTitle: true,),
      body: _index < _questions.length ? Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
        SizedBox(height: 20,),

        Questions(_questions[_index][1]),

        SizedBox(height: 20,),
          Answer(_onPass,_questions[_index]["Answers"][0]),
          Answer(_onPass,_questions[_index]["Answers"][1],),
          Answer(_onPass,_questions[_index]["Answers"][2]),
          Answer(_onPass,_questions[_index]["Answers"][3]),
      ],):Center(child: Text("you did it"),),
    );
  }
}

