

import 'package:flutter/material.dart';
import 'package:pooja_for_everyone/view/Nwespage/news.dart';

class TraditonalPlaces extends StatelessWidget {
  const TraditonalPlaces({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar:AppBar(
          title: const  Padding(
            padding:  EdgeInsets.only(top: 15),
            child: Center(child: Text('Traditional Places',style: TextStyle(fontSize: 25,),)),
          ),
          backgroundColor: Colors.orangeAccent.shade200,
            automaticallyImplyLeading: false,

        ) ,
        body: Column()

      )
    );
  }
}
