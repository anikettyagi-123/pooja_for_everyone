import 'package:cloud_firestore/cloud_firestore.dart';

Future<Map<String, dynamic>?> poshakInside(String documentId) async {
  try {
    DocumentSnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore.instance
        .collection('poshak')
        .doc(documentId)
        .get();
    if (snapshot.exists) {
      Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
      return data;
    } else {
     // print("Document does not exist for the given documentId: $documentId"); // Debugging line
      return null;
    }
  } catch (error) {
   // print("Error fetching data from Firestore: $error"); // Debugging line
    return null;
  }
}
