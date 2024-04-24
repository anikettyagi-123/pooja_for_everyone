


import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

import 'welcome_Screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}


class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3), () { Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Welcome_Screen()));
    } );}

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.orange.shade200,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/swastik.png',
              height: MediaQuery.of(context).size.height*.2,
              width: MediaQuery.of(context).size.width*.8,),
              SizedBox(
                height: MediaQuery.of(context).size.height*.02,
              ),
              AnimatedTextKit(
                animatedTexts: [
                  ScaleAnimatedText('ॐ स्वागतम्',
                      textStyle: const TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                      duration: const Duration(seconds: 5))
                ],
              ),


            ],
          ),
        ),

      ),
    );
  }
}
