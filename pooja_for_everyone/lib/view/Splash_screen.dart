import 'dart:async';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gif_view/gif_view.dart';

import '../controller/welcomew controller.dart';

import 'welcome_screen/welcome_Screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Get.put(VolumeController());

    Timer(const Duration(milliseconds: 1500), () {
      Get.offAll(() => WelcomeScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        //  backgroundColor: Colors.orangeAccent,
        body: Center(
          child: GifView.asset(
            'assets/splash.gif',
            width: double.infinity,
            height: double.infinity,
            // Full width

           fit: BoxFit.cover
            , // Covers the full width properly
          ),
        ),
      ),
    );
    // Middle Content: Logo + Text
    // Expanded(
    //   flex: 2, // Takes more space in the center
    //   child: Column(
    //     mainAxisAlignment: MainAxisAlignment.center,
    //     children: [
    //       // Swastik Logo
    //       Image.asset(
    //         'assets/swastik.png',
    //         height: height * 0.18, // Adjusted size
    //         width: width * 0.35,
    //         fit: BoxFit.contain,
    //       ),
    //       SizedBox(height: height * 0.03),
    //
    //       // Animated Text
    //       AnimatedTextKit(
    //         animatedTexts: [
    //           ScaleAnimatedText(
    //             'ॐ स्वागतम्',
    //             textStyle: TextStyle(
    //               fontSize: height * 0.06,
    //               fontWeight: FontWeight.bold,
    //               color: Colors.white,
    //             ),
    //             duration: const Duration(seconds: 3),
    //           ),
    //         ],
    //       ),
    //     ],
    //   ),
    // ),

    // Bottom Splash Image
    // Expanded(
    //   flex: 1, // Less space, so image stays at bottom
    //   child: Align(
    //     alignment: Alignment.bottomCenter,
    //     child:  GifView.asset(
    //       'assets/splash.gif',
    //       width: double.infinity, // Full width
    //       fit: BoxFit.cover, // Covers the full width properly
    //     ),
    //   ),
    // ),
  }
}
