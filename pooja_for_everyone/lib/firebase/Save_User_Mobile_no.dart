

// storing mobile no. once user verified
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';





String MobileNo = '';


void saveUserMobileNo() async{


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
          'mobileNumber':MobileNo ,


        });
      } else {
        users.doc(user.uid).set({"mobileNumber":MobileNo });
      }
    })
        .then((_) {})
        .catchError((error) {});
  }
}