import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:pooja_for_everyone/view/Login_otp/Login_screen.dart';

import '../User_Address/Address.dart';

isLogin() {
  final auth = FirebaseAuth.instance;
  final user = auth.currentUser;


  if(user != null){
    Get.to(()=>AddressScreen());


  }else{
    Get.to(()=>LoginScreen());

  }

}