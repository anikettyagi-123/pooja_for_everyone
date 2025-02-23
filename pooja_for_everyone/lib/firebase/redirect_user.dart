


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:pooja_for_everyone/view/Pandit/Pandit.dart';
import 'package:pooja_for_everyone/view/User_Address/Address.dart';

import '../global/Utils.dart';
import '../view/Samagrhi/samagrhi.dart';

void RedirectUser(String? sectionSelected) async{
  try {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      CollectionReference users =
      FirebaseFirestore.instance.collection('user_gernal_mobile_no');
      users.doc(user.uid).get().then((DocumentSnapshot documentSnapshot) {
        if (documentSnapshot.exists) {
          Map<String, dynamic>? data =
          documentSnapshot.data() as Map<String, dynamic>?;
          if (data != null && data.containsKey('mobileNumber')&&(!data.containsKey('pinCode'))) {
            Get.to(() => AddressScreen(selectedSection: sectionSelected ));

        }else if(data != null && data.containsKey('pinCode')){
            if(sectionSelected=='Pandit'){
              Get.to(() => areaPandit());

            }else if (sectionSelected=='Samagrhi'){
              Get.to(() => Samagrhi());
            }

          } //else  {
        //   Get.to(() => LoginScreen());
        // }
      }});
    }
  } catch (error) {
    String errorMessage = 'Please check Internet';
    Utils().toastMessage(errorMessage.toString());
    // Handle error or log error message
  }
}
