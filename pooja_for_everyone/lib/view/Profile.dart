
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pooja_for_everyone/view/welcome_screen/welcome_Screen.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = FirebaseAuth.instance;

    return
      SafeArea(
        child: Scaffold(
          body:Column(
          children: [
            Center(
              child: InkWell(
                onTap: (){auth.signOut().then(
                      (value) {
                    Get.deleteAll();
                    Get.offAll(()=> WelcomeScreen());

                  },
                );},
                  child: Text('Logout')),
            ),
            InkWell(
              onTap: (){
                Get.changeTheme(ThemeData.light());
              },
                child: Text('Light Theme' )),
            InkWell(
              onTap:(){  Get.changeTheme(ThemeData.dark());},
                child: Text('Dark Theme'))
          
          ],
        
              ),
        ),
      );
  }
}
