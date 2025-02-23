import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pooja_for_everyone/global/Utils.dart';

Future<void> cartData(String poshakId,String? price) async {
  User? user = FirebaseAuth.instance.currentUser;
  if (user != null) {
    // Reference to the user's cart document
    DocumentReference userCartDoc = FirebaseFirestore.instance.collection('userCart').doc(user.uid);

    // Reference to the sub-collection 'poshakList' under the user's cart document
    CollectionReference poshakListCollection = userCartDoc.collection('poshakList');

    try {
      // Use Firestore transaction to update the cart atomically
      await FirebaseFirestore.instance.runTransaction((transaction) async {
        // Check if the poshak item already exists in the user's cart
        DocumentSnapshot poshakSnapshot = await transaction.get(poshakListCollection.doc(poshakId));

        if (!poshakSnapshot.exists) {
          // If the item is not already in the cart, add it
          transaction.set(poshakListCollection.doc(poshakId), {
            'addedAt': FieldValue.serverTimestamp(), // Optional: Track when the item was added
            'quantity': 1,
            'price':price,// Optional: Store quantity, default to 1

          });
          Utils().toastMessage('Item added successfully');
        } else {
          // If the item already exists, you can handle it as needed (e.g., update quantity)
          Utils().toastMessage('Item already in the cart');
        }
      });

    } catch (error) {
      // Show error message
      Utils().toastMessage('Please check your internet connection');
    }
  }
}
// this code is for updating the quantity












Future<void>updateQuantity(String poshakId , int quantity,String price) async{


  User? user = FirebaseAuth.instance.currentUser;

  if (user != null) {
    DocumentReference userCoc =
    FirebaseFirestore.instance.collection('userCart').doc(user.uid);
    CollectionReference poshakListCollection = userCoc.collection('poshakList');
    try{
     await poshakListCollection.doc(poshakId).update({'quantity':quantity,'price':quantity*int.parse(price)});
      }catch(error){}

    }
  }

