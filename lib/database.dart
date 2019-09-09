import 'dart:io';


import 'package:path_provider/path_provider.dart';
import 'package:quiz_app/model.dart';
import 'dart:async';
import 'package:sqflite/sqflite.dart';

 class DataBaseDB{

  static final DataBaseDB _dataBaseDB=DataBaseDB._internal();
 //  DataBaseDB._internal();
  DataBaseDB._internal();

   factory DataBaseDB(){
     return _dataBaseDB;
   }

static Database _db;

Future<Database> get db async{

  if(_db !=null){
    return _db;
  }else{
    _db =await intilitize();
    return _db;
  }
}


intilitize()async{

  Directory directory =await getApplicationDocumentsDirectory();
  var path = directory.path + "quiz.db";
  //String paths= Join


 var openDb = await openDatabase(path,version:  1,onCreate: createDb);
 return openDb;
}

  void createDb(Database db,int version)async{
    await db.execute("CREATE TABLE quiz_records(id INTEGER PRIMARY KEY,total_questions INTEGER,right INTEGER,"
        "wrong INTEGER,score INTEGER,medal_name TEXT,medal_icon TEXT,date TEXT,time TEXT)");
   // 'CREATE TABLE Test (id INTEGER PRIMARY KEY, name TEXT, value INTEGER, num REAL)'
  }

  Future<int>saveData(Model model)async{
  var dbClient =await db;
  int res=  await dbClient.insert("quiz_records",model.tomap());
  return res;
  }

  Future<List>getData()async{
  var dbClient =await db;
  var result = await dbClient.rawQuery("SELECT * FROM quiz_records");
  return result;
  }

  Future<int>deleteData(int id)async{
  var dbClient = await db;
  return await dbClient.delete("quiz_records",where: "id=?",whereArgs: [id]);
  }


}