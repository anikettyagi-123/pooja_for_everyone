

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<List<Map<String, dynamic>>> fetchCartItems() async {
  User? user = FirebaseAuth.instance.currentUser;

  if (user == null) {
    // If user is not logged in, return an empty list
    return [];
  }

  try {
    // Reference to the user's cart document
    DocumentReference userCartDoc = FirebaseFirestore.instance.collection('userCart').doc(user.uid);

    // Reference to the sub-collection 'poshakList' under the user's cart document
    CollectionReference poshakListCollection = userCartDoc.collection('poshakList');

    // Fetch all documents (item IDs) in the 'poshakList' sub-collection
    QuerySnapshot cartSnapshot = await poshakListCollection.get();

    List<Map<String, dynamic>> cartItems = [];

    for (QueryDocumentSnapshot cartDoc in cartSnapshot.docs) {
      String poshakId = cartDoc.id;// Get the item ID from each document
      int quantity = cartDoc.get('quantity')??1;
      String price = cartDoc.get('price')?.toString()??'0';


      // Fetch the details of each item from the 'poshak' collection
      DocumentSnapshot poshakSnapshot = await FirebaseFirestore.instance.collection('poshak').doc(poshakId).get();

      if (poshakSnapshot.exists) {
        Map<String, dynamic> poshakData = poshakSnapshot.data() as Map<String, dynamic>;

        cartItems.add({
          'quantity': quantity,
          'id': poshakId,
          'downloadLink': poshakData['downloadLink'],
          'actualPrice': poshakData['actualPrice'],
          'doscount': poshakData['discount'],
          'description': poshakData['description'],
          'heading': poshakData['heading'],
          'price':price
          // Add other fields as needed
        });
      }
    }

    return cartItems;

  } catch (error) {
   // print('Error fetching cart items: $error');
    return [];
  }
}
