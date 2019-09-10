import 'package:flutter/material.dart';


class ApBar extends StatelessWidget {
  final String barName;
  ApBar(this.barName);

  @override
  Widget build(BuildContext context) {
    return  LayoutBuilder(
      builder: (context ,constrins){
        return Card(
          elevation: 3,
          shape: CircleBorder(side: BorderSide(style:BorderStyle.none,),),
          child: Container(
            height: 100,
            width: 150,
            alignment: Alignment.center,
            child:  Padding(
                padding: EdgeInsets.only(top: 30),
                child: Text(barName,style: Theme.of(context).textTheme.headline,)),
          ),
        );
      },

    );
  }
}
