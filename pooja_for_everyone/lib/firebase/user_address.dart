import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';


import '../controller/User_Address_Controller.dart';

void userAddress() async {
  final AddressController addressController = Get.put(AddressController());
  User? user = FirebaseAuth.instance.currentUser;
  if (user != null) {
    CollectionReference users =
        FirebaseFirestore.instance.collection('user_gernal_mobile_no');
    users.doc(user.uid).get().then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        users.doc(user.uid).update({
          'userName': addressController.userName.text,
          'houseNo': addressController.houseNo.text,
          'area': addressController.area.text,
          'landMark': addressController.landMark.text,
          'pinCode': addressController.pinCode.text,
          'town': addressController.town.text,
          'state': addressController.state.text,
          'contactNo': addressController.contactNo.text,
        });
      } else {
        users.doc(user.uid).set({
          'userName': addressController.userName.text,
          'houseNo': addressController.houseNo.text,
          'area': addressController.area.text,
          'landMark': addressController.landMark.text,
          'pinCode': addressController.pinCode.text,
          'town': addressController.town.text,
          'state': addressController.state.text,
          'contactNo': addressController.contactNo.text,
        });
      }
    });
  }
}
