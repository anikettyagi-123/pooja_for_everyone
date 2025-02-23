import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:pooja_for_everyone/view/Login_otp/Login_screen.dart';

import '../../firebase/redirect_user.dart';

isLogin(String? sectionClicked ) {
  final auth = FirebaseAuth.instance;
  final user = auth.currentUser;


  if(user != null){
    RedirectUser(sectionClicked);
    //Get.to(()=>AddressScreen(selectedSection: sectionClicked,));


  }else{
    Get.to(()=>LoginScreen(selectedSection: sectionClicked,));

  }

}