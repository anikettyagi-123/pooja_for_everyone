
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../global/appbar.dart';

class poojaPackage extends StatelessWidget {
  const poojaPackage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          Center(child: Text('Pooja Packages will be available shortly ',style: TextStyle(fontSize: 17),))
        ],
      ),
    );
  }
}
