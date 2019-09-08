class Model {
  int total_questions;
  int right;
  int wrong;
  int score;
  String medal_name;
  String medal_icon;
  String date;
  String time;

  Model(this.total_questions, this.right, this.wrong, this.score,
      this.medal_name, this.medal_icon, this.date, this.time);


  Map<String ,dynamic> tomap(){
  var map =Map <String ,dynamic>();
  map['total_questions']=total_questions;
  map['right']=right;
  map['wrong']=wrong;
  map['score']=score;
  map['medal_name']=medal_name;
  map['medal_icon']=medal_icon;
  map['date']=date;
  map['time']=time;
  return map;
}




}
