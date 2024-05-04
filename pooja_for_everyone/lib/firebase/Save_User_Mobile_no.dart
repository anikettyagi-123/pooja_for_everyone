

// storing mobile no. once user verified
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Controllers/Login&otp/Login_controller.dart';


void saveUserMobileNo() async{
  final LoginController loginController = Get.put(LoginController());
  User? user = FirebaseAuth.instance.currentUser;
  if (user != null) {
    CollectionReference users =
    FirebaseFirestore.instance.collection('user_gernal_mobile_no');

    users
        .doc(user.uid)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        users.doc(user.uid).update({
          'mobileNumber':loginController.phoneController.text.toString() ,
        });
      } else {
        users.doc(user.uid).set({"mobileNumber":loginController.phoneController.text.toString() });
      }
    })
        .then((_) {})
        .catchError((error) {});
  }
}