import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix0;
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


     Future<Map> getdata()async{
     String url= "https://opentdb.com/api.php?amount=10&category=9&difficulty=easy&type=multiple";
     final response = await http.get(url);
     var jsonData= json.decode(response.body);
       print(jsonData);
       as= jsonData['results'];
       print(as);
       print(as.length);
        return null;
     }

  @override
  void initState(){
    getdata();
    super.initState();
  }


   _onLoading(BuildContext context) {
//    showDialog(
//      context: context,
//      barrierDismissible: false,
//      builder: (context){
        print(as);
        if(as ==null){
        showDialog(context: context ,barrierDismissible:  false,
        builder: (context){
          return
            Center(child: CircularProgressIndicator());
        });
        }else{



          Navigator.of(context).pop();
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


//          Dialog(
//          child: new Row(
//            mainAxisSize: MainAxisSize.min,
//            children: [
//               CircularProgressIndicator(),
//              Text("time left $seconds"),
//            ],
//          ),
//        );
//      },
//    );
//    new Future.delayed(new Duration(seconds: seconds), () {
//
//      Navigator.push(context, MaterialPageRoute(builder: (context){
//       List buttons =[
//          as[0]['correct_answer'],
//          //widget._questions[widget._index]["Answers"][0]["Score"],
//
//          as[0]['incorrect_answers'][0],
//          //widget._questions[widget._index]["Answers"][1]["Score"],
//
//          as[0]['incorrect_answers'][1],
//          // widget._questions[widget._index]["Answers"][2]["Score"],
//
//          as[0]['incorrect_answers'][2],
//          // widget._questions[widget._index]["Answers"][3]["Score"],
//
//        ];
//        buttons.shuffle();
//
//        return Quiz(as,buttons);
//      }));


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
            FlatButton(onPressed:(){_onLoading(context);}, child: Text("submit")),
          ],
        ));
  }
}
