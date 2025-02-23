

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../global/appbar.dart';

class TraditonalPlaces extends StatelessWidget {
  const TraditonalPlaces({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: MyAppbar(),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(child: Lottie.asset('animation/error.json',
                //  height: MediaQuery.of(context).size.height*1,
                width: MediaQuery.of(context).size.width*.5
            ),


            ),
            Center(child: Text('Travel plans will be available shortly ',style: TextStyle(fontSize: 17),))
          ],
        ),

      )
    );
  }
}
