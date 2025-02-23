// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:pooja_for_everyone/global/Utils.dart';
// import '../firebase/user_address.dart';
// import '../firebase/welcome_firebase.dart';
//
// class AppBarController extends GetxController {
//   var isLoading = true.obs;
//   var addressList = <Map<String, dynamic>>[].obs;
//
//   @override
//   void onInit() {
//     super.onInit();
//     fetchAddress(); // Fetch address initially
//   }
//
//   /// Fetches user address from Firebase
//   Future<void> fetchAddress() async {  // Changed to Future<void>
//     try {
//       isLoading(true);
//       Map<String, dynamic>? fetch = await fetchUserDetails();
//       if (fetch != null && fetch.isNotEmpty) {
//         addressList.value = [fetch];
//       } else {
//         addressList.clear();
//       }
//     } finally {
//       isLoading(false);
//     }
//   }
//
//   /// Updates user address and refreshes the UI dynamically
//   Future<void> updateAddress({
//     required String userName,
//     required String houseNo,
//     required String area,
//     required String landMark,
//     required String pincode,
//     required String town,
//     required String state,
//     required String contactNo,
//   }) async {
//     try {
//       isLoading(true);
//
//       // Call Firebase function to update the address
//       await updateUserAddress(
//         userName,
//         houseNo,
//         area,
//         landMark,
//         pincode,
//         town,
//         state,
//         contactNo,
//       );
//
//       // Fetch updated address to refresh UI
//       await fetchAddress();  // Now fetchAddress() can be awaited
//     } finally {
//      // print('hhhhhhhhhhhhhhhhhhhh');
//       isLoading(false);
//       Future<void> updateAddress({
//         required String userName,
//         required String houseNo,
//         required String area,
//         required String landMark,
//         required String pincode,
//         required String town,
//         required String state,
//         required String contactNo,
//       }) async {
//         try {
//           isLoading(true);
//
//           // Call Firebase function to update the address
//           await updateUserAddress(
//             userName,
//             houseNo,
//             area,
//             landMark,
//             pincode,
//             town,
//             state,
//             contactNo,
//           );
//
//           // Fetch updated address to refresh UI
//           await fetchAddress();
//         } finally {
//           isLoading(false);
//
//           // Show Snackbar
//
//
//        Utils().toastMessage( '✔ Done Address updated successfully');
//       Navigator.of(Get.context!).pop();
//
//       // Get.snackbar('Done', 'Address updated successfully', snackPosition: SnackPosition.BOTTOM);N
//     }
//   }
// }
// }
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pooja_for_everyone/global/Utils.dart';
import '../firebase/user_address.dart';
import '../firebase/welcome_firebase.dart';

class AppBarController extends GetxController {
  var isLoading = true.obs;
  var addressList = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchAddress(); // Fetch address initially
  }

  /// Fetches user address from Firebase
  Future<void> fetchAddress() async {
    try {
      isLoading(true);
      Map<String, dynamic>? fetch = await fetchUserDetails();
      if (fetch != null && fetch.isNotEmpty) {
        addressList.value = [fetch];
      } else {
        addressList.clear();
      }
    } finally {
      isLoading(false);
    }
  }

  /// Updates user address and refreshes the UI dynamically
  Future<void> updateAddress({
    required String userName,
    required String houseNo,
    required String area,
    required String landMark,
    required String pincode,
    required String town,
    required String state,
    required String contactNo,
  }) async {
    try {
      isLoading(true);

      // Call Firebase function to update the address
      await updateUserAddress(
        userName,
        houseNo,
        area,
        landMark,
        pincode,
        town,
        state,
        contactNo,
      );

      // Fetch updated address to refresh UI
      await fetchAddress();

      // Show success message after completion
      Utils().toastMessage('✔ Address updated successfully');

      // Close the dialog or navigate back
      if (Get.isDialogOpen ?? false) {
        Get.back(); // Close  dialog if open
      }
      Get.back(); // Navigate back

    } finally {
      isLoading(false);
    }
  }
}
