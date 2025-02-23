

// storing mobile no. once user verified
import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';





String MobileNo = '';


Future<void>saveUserMobileNo() async{


  User? user = FirebaseAuth.instance.currentUser;

  if (user != null) {
    CollectionReference users =
    FirebaseFirestore.instance.collection('user_gernal_mobile_no');
try{
  DocumentSnapshot documentSnapshot = await users.doc(user.uid).get();

      if (documentSnapshot.exists) {
        users.doc(user.uid).update({
          'mobileNumber':MobileNo ,


        });
      } else {
        users.doc(user.uid).set({"mobileNumber":MobileNo });
      }

  }catch(error){}
  }}
