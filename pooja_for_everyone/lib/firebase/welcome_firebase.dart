

//in this page i am taking image from database to to show that in welcome screen
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../global/Utils.dart';
Future<String?> getImageOfGodUrls() async {
  try {
    String dayOfWeek = _getCurrentDayOfWeekName();
    DocumentSnapshot snapshot = await FirebaseFirestore.instance
        .collection('images')
        .doc('8XVQbShh7bxTyAqTXSOy')
        .get();
    if (snapshot.exists) {
      Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
      return data[dayOfWeek];
    } else {
      return null;
    }
  } catch (error) {

    return null;
  }
}

String _getCurrentDayOfWeekName() {
  DateTime now = DateTime.now();
  List<String> weekdays = ['monday', 'tuesday', 'wednesday', 'thrusday', 'friday', 'saturday', 'sunday'];
  return weekdays[now.weekday - 1];
}
Future<Map<String, dynamic>?> fetchUserDetails() async {
  try {
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      // Fetch the document for the current user's UID
      DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
          .collection('user_gernal_mobile_no')
          .doc(user.uid)
          .get();

      if (documentSnapshot.exists) {
        // Convert the document data to a Map and return it
        return documentSnapshot.data() as Map<String, dynamic>;
      } else {
        print("Document does not exist for the current user.");
        return null;
      }
    } else {
      print("User is not authenticated.");
      return null;
    }
  } catch (error) {
    // Handle errors
    String errorMessage = 'Please check Internet';
    Utils().toastMessage(errorMessage.toString());
    return null;
  }
}


//
// Future<void> fetchAndSaveUserDetails() async {
//   try {
//     User? user = FirebaseAuth.instance.currentUser;
//
//     if (user != null) {
//       // Reference to the Firestore collection
//       CollectionReference users =
//       FirebaseFirestore.instance.collection('user_gernal_mobile_no');
//
//       // Fetch the document using the user's UID
//       DocumentSnapshot documentSnapshot = await users.doc(user.uid).get();
//
//       // Check if the document exists
//       if (documentSnapshot.exists) {
//         // Get all fields as a Map
//         Map<String, dynamic> userDetails =
//         documentSnapshot.data() as Map<String, dynamic>;
//
//         print('Fetched User Details: $userDetails'); // Debug fetched data
//
//         // Save the map as a JSON string in SharedPreferences
//         SharedPreferences prefs = await SharedPreferences.getInstance();
//         await prefs.setString('userDetails', jsonEncode(userDetails));
//
//         print("User details saved in SharedPreferences.");
//       } else {
//         print('Document does not exist.');
//       }
//     }
//   } catch (error) {
//     // Display error message
//     String errorMessage = 'Please check Internet';
//     Utils().toastMessage(errorMessage);
//   }
// }
// Future<Map<String, dynamic>?> getUserDetailsFromPreferences() async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   String? userDetailsJson = prefs.getString('userDetails');
//
//   if (userDetailsJson != null) {
//     // Convert JSON string back to Map
//     return jsonDecode(userDetailsJson) as Map<String, dynamic>;
//   }
//
//   return null;
// }
//
