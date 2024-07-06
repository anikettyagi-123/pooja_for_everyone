import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pooja_for_everyone/global/costumised%20aap%20bar/three_dot/tree_dot_global.dart';
import 'package:pooja_for_everyone/view/Profile.dart';

import '../../../view/Login_otp/Login_screen.dart';
import '../../../view/Login_otp/check_user_login.dart';

class Three_Dot extends StatelessWidget {
  const Three_Dot({super.key});

  @override
  Widget build(BuildContext context) {
    final height =  MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * .25),
                    child: Center(
                        child: Image.asset(
                      'assets/back.png',
                      color: Colors.grey.shade200,
                    )),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .08,
                      ),
                       OneForAll(name: 'Profile'.tr,onPressed: (){Get.to(()=>Profile());},),
                      Divider(height: height * .025),
                      OneForAll(name: 'View Shopping Cart'.tr,onPressed: (){
                        isLogin('Cart');
          
                      },),
                      Divider(height: height * .025),
                      OneForAll(name: 'Notification'.tr,),
                      Divider(height: height * .025),
                      OneForAll(name: 'Transactions'.tr,textStyle:const TextStyle(fontWeight: FontWeight.w700,fontSize: 20,fontStyle: FontStyle.italic),
                      onPressed: (){ isLogin('Transactions');},),
                      Divider(height: height * .025),
                      OneForAll(name: 'Samagrhi'.tr,textStyle:const TextStyle(fontWeight: FontWeight.w700,fontSize: 20,fontStyle: FontStyle.italic),
                      onPressed:(){ isLogin('Samagrhi');} ,),
                      Divider(height:height * .025),
                      OneForAll(name: 'Pooja Package'.tr,),
                      Divider(height: height * .025),
                      OneForAll(name: 'Help'.tr,),
                      Divider(height: height * .025),
                      OneForAll(name: 'FeedBack'.tr,),
                    ],
                  ),
          
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
