import 'package:flutter/material.dart';

main(){
runApp(
    MaterialApp(

      home: App(),));
}

class App extends StatelessWidget{
 // var style=

 void onPass(BuildContext context,
     String no){
     String no1=no;
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
      body: Column(children: <Widget>[
        Text("this  what's the question?"),
        RaisedButton(child: Text("answer 1"),onPressed: ()=> onPass(context,"answer 1")),
        RaisedButton(child: Text("answer 2"),onPressed: null),
        RaisedButton(child: Text("answer 3"),onPressed: null),
        RaisedButton(child: Text("answer 4"),onPressed: null),
      ],),
    );
  }

}

