

import 'package:flutter/material.dart';
import 'package:pooja_for_everyone/view/traditional%20places/news.dart';

class TraditonalPlaces extends StatelessWidget {
  const TraditonalPlaces({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: SafeArea(
          child: Scaffold(
            appBar:AppBar(
              title: const  Padding(
                padding:  EdgeInsets.only(top: 15),
                child: Center(child: Text('Traditional Places',style: TextStyle(fontSize: 25,),)),
              ),
              backgroundColor: Colors.orangeAccent.shade200,
                automaticallyImplyLeading: false,
              bottom:const TabBar(
                tabs: [
                  Tab(text: 'News',),
                  Tab(text: 'Temples',),

                  Tab(text: 'Tour&Travel')

                ],
              )
            ) ,
            body: const  TabBarView(
              children: [
               NewsPage(),
                Center(child: Text('Temples\n curently nothing to show',textAlign:TextAlign.center,)),
                Center(child: Text('Tour package\n curently nothing to show',textAlign:TextAlign.center,))
              ],
            )

          ),
        ));
  }
}
