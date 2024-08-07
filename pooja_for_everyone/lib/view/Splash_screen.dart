


import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controller/welcomew controller.dart';
import '../firebase/welcome_firebase.dart';
import 'welcome_screen/welcome_Screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}


class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    final volumeController = Get.put(VolumeController());
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3), () {Get.offAll(()=>WelcomeScreen());

    } );}

  @override
  Widget build(BuildContext context) {
    final volumeController = Get.put(VolumeController());
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.orangeAccent,
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
