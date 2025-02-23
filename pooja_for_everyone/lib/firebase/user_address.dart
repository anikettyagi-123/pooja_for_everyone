import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:pooja_for_everyone/global/Utils.dart';

import '../controller/User_Address_Controller.dart';
import '../view/Pandit/Pandit.dart';
import '../view/Samagrhi/samagrhi.dart';

Future<void> userAddress(String? selectedSection) async {
  final AddressController addressController = Get.put(AddressController());
  User? user = FirebaseAuth.instance.currentUser;

  if (user != null) {
    CollectionReference users =
        FirebaseFirestore.instance.collection('user_gernal_mobile_no');

    try {
      DocumentSnapshot documentSnapshot = await users.doc(user.uid).get();

      if (documentSnapshot.exists) {
        await users.doc(user.uid).update({
          'userName': addressController.userName.text,
          'houseNo': addressController.houseNo.text,
          'area': addressController.area.text,
          'landMark': addressController.landMark.text,
          'pinCode': addressController.pinCode.text,
          'town': addressController.town.text,
          'state': addressController.state.text,
          'contactNo': addressController.contactNo.text,
        });
        Get.snackbar('Done', 'Address updated sucessfully');

        Utils().toastMessage('Address updated successfully');
      } else {
        await users.doc(user.uid).set({
          'userName': addressController.userName.text,
          'houseNo': addressController.houseNo.text,
          'area': addressController.area.text,
          'landMark': addressController.landMark.text,
          'pinCode': addressController.pinCode.text,
          'town': addressController.town.text,
          'state': addressController.state.text,
          'contactNo': addressController.contactNo.text,
        });

        Utils().toastMessage('Address saved successfully');
      }

      // Navigate only after address is updated or set
      if (selectedSection == 'Pandit') {
        Get.off(() => areaPandit());
      } else if (selectedSection == 'Samagrhi') {
        Get.off(() => Samagrhi());
      } else {
        Get.back();
      }
    } catch (e) {
      Utils().toastMessage('Error updating address: $e');
    }
  }
}

/// for updating the adress

final AddressController addressController = Get.put(AddressController());

/// Function to set user address (when no address exists)
Future<void> setUserAddress(String? selectedSection) async {
  User? user = FirebaseAuth.instance.currentUser;
  if (user == null) return;

  CollectionReference users = FirebaseFirestore.instance.collection('user_gernal_mobile_no');

  try {
    DocumentSnapshot documentSnapshot = await users.doc(user.uid).get();

    if (documentSnapshot.exists) {
      Map<String, dynamic> data = documentSnapshot.data() as Map<String, dynamic>;
      // Check if address fields are already set
      if (data.containsKey('userName') && data['userName'].toString().isNotEmpty) {
        return; // If address exists, do nothing
      }
    }

    // If no address exists, set a new one
    await users.doc(user.uid).set({
      'userName': addressController.userName.text,
      'houseNo': addressController.houseNo.text,
      'area': addressController.area.text,
      'landMark': addressController.landMark.text,
      'pinCode': addressController.pinCode.text,
      'town': addressController.town.text,
      'state': addressController.state.text,
      'contactNo': addressController.contactNo.text,
    }, SetOptions(merge: true)); // Merge ensures the user doc is not overwritten

    // Navigate based on selection
    if (selectedSection == 'Pandit') {
      Get.off(() => areaPandit());
    } else if (selectedSection == 'Samagrhi') {
      Get.off(() => Samagrhi());
    }
  } catch (e) {
    Utils().toastMessage('Error saving address: $e');
  }
}




/// Function to update user address (when address already exists)
Future<void> updateUserAddress(
    String userName, String houseNo, String area, String landmark, String pincode, String town, String state, String contactNo) async {
  User? user = FirebaseAuth.instance.currentUser;
  if (user == null) return;

  CollectionReference users =
  FirebaseFirestore.instance.collection('user_gernal_mobile_no');

  try {
    await users.doc(user.uid).update({
      'userName': userName,
      'houseNo': houseNo,
      'area': area,
      'landMark': landmark,
      'pinCode': pincode,
      'town': town,
      'state': state,
      'contactNo': contactNo,
    });

    // Ensure the UI has time to process the snackbar
    // Future.delayed(Duration(milliseconds: 500), () {
    //   Get.snackbar('Done', 'Address updated successfully', snackPosition: SnackPosition.BOTTOM);
    //   Get.back();
    // });

  } catch (e) {
    Get.snackbar('Error', 'Error updating address: $e');
  }
}
