import "package:flutter/material.dart";

import './database.dart';
import './widgets/row.dart';

class TopScors extends StatefulWidget {
  @override
  _TopScorsState createState() => _TopScorsState();
}

class _TopScorsState extends State<TopScors> {

  List allTopScores;

  @override
  void initState(){
    doit();
    super.initState();
  }

  doit()async{
    DataBaseDB _db =DataBaseDB();
    allTopScores=await _db.getData();
    print(allTopScores);
  }

  //List user = await _db.getData();


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: allTopScores.map((allScores){
          return Column(
              children: <Widget>[
                Rows(allScores[0]['total_questions'], allScores[0]['right'], allScores['wrong'])
              ],
          );
        }).toList(),
      ),
    );
  }
}
