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
  List _questions=[
    "where is Bhopal",
    "who is the president of India",
  ];

  var _index= 0;

 void _onPass(BuildContext context, String no){
     String no1=no;
     setState(() {
       _index = _index +1;
     });

   var alert = AlertDialog(title: Text("${no1}result"),
   content: Text("your anwser is wrong"),
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

  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      appBar: AppBar(title: Text("Quiz App"),centerTitle: true,),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
        SizedBox(height: 20,),

        Questions(_questions[_index]),

        SizedBox(height: 20,),
        Answer(_onPass),
        RaisedButton(child: Text("answer 2"),onPressed: null),
        RaisedButton(child: Text("answer 3"),onPressed: null),
        RaisedButton(child: Text("answer 4"),onPressed: null),
      ],),
    );
  }
}

