



import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<List<Map<String, dynamic>>?> Pandit_locations() async {
  User? user = FirebaseAuth.instance.currentUser;
  List<Map<String, dynamic>> panditLocations = [];

  if (user != null) {
    CollectionReference<Map<String, dynamic>> users =
    FirebaseFirestore.instance.collection('panditji');
    QuerySnapshot<Map<String, dynamic>> querySnapshot =
    await users.get();

    if (querySnapshot.docs.isNotEmpty) {
      querySnapshot.docs.forEach((doc) {
        Map<String, dynamic> shopLocation = {
          'ShopImage': doc.get('ShopImage'),
          'latitude': doc.get('latitude'),
          'longitute': doc.get('longitute'),
          'shopName': doc.get('shopName'),
          'shopAddress': doc.get('shopAddress'),
          'shopHolderName':doc.get('shopHolderName'),
          'Discount':doc.get('Discount'),
          'Category':doc.get('Category')
        };
        panditLocations.add(shopLocation);
      });
      return   panditLocations;
    }
  }
  return null;
}