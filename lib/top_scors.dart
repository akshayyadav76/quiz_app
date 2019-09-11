import "package:flutter/material.dart";

import './database.dart';
import './widgets/row.dart';
import 'widgets/ap_bar.dart';

class TopScors extends StatefulWidget {
  @override
  _TopScorsState createState() => _TopScorsState();
}

class _TopScorsState extends State<TopScors> {

  List allTopScores;
  DataBaseDB _db =DataBaseDB();

  @override
  void initState(){
    doit();
    super.initState();
  }

  doit()async{

   List allTopScoresGet=await _db.getData();
    print(allTopScores);

    setState(() {
      print("setDatae");
      allTopScores=allTopScoresGet;
    });

  }


  @override
  Widget build(BuildContext context) {
    print("sssdasdaddadadd$allTopScores");
    return allTopScores ==null?Scaffold(
      body: Center(child: Text("Loading Data...")),
    ):Scaffold(
        body: Column(
          children: <Widget>[
          Container(
              height: MediaQuery.of(context).size.height*0.25,
              child: Column(
                  children: <Widget>[
                    ApBar("Top Scores"),
                    Text("<- Swipe left or right to delete ->",style: Theme.of(context).textTheme.title,)
                  ],
                   )),
          Container(
            height:  MediaQuery.of(context).size.height*0.75,
            child: ListView.builder(
                itemCount:  allTopScores.length,
                itemBuilder: (context,index){
                  return Container(
                    height: MediaQuery.of(context).size.height*0.3,
                   // width: 100,
                    child: Dismissible(
                        key: Key("$index"),
                        direction: DismissDirection.horizontal,
                        onDismissed:(dir)async{
                          await _db.deleteData(allTopScores[index]['id']);

                        },
                        background: Container(
                        //  height: MediaQuery.of(context).size.height*0.3,
                          color: Colors.red,
                        ),
                        child: Column(
                            children: <Widget>[
                              Container(

                                height:  MediaQuery.of(context).size.height*0.15,
                                width:  MediaQuery.of(context).size.width*1,

                                  child: Rows(allTopScores[index]['total_questions'], allTopScores[index]['right'],
                                                allTopScores[index]['wrong']),
                              ),
                              Card(
                                child: ListTile(leading: Image.asset(allTopScores[index]['medal_icon'],
                                  height: 60,width: 60,),
                                    title: FittedBox(fit: BoxFit.scaleDown,
                                      child: Text(allTopScores[index]['medal_name'],style: Theme.of(context).textTheme.headline,
                                        textAlign: TextAlign.center,),
                                    ),
                                    trailing: Column(
                                      children: <Widget>[
                                        Text("Score",style: Theme.of(context).textTheme.title,),
                                        Text("${allTopScores[index]['score']}",style: Theme.of(context).textTheme.title,)
                                      ],
                                    ),
                                    subtitle: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Text(allTopScores[index]['date'],style: Theme.of(context).textTheme.body2,),
                                        Text(allTopScores[index]['time'],style: Theme.of(context).textTheme.body2,),
                                      ],)
                                ),
                              ),
                            ])),
                  );
                })
          )
        ],)
   );
    //);
  }
}
