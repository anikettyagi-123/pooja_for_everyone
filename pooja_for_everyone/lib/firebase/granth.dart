import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

Future<String?> getGranthText( String fieldName,String collectionName ,String documentId) async {
  try {
    // Fetch document from Firestore
    DocumentSnapshot<Map<String, dynamic>> mantraDocSnapshot =
    await FirebaseFirestore.instance
        .collection('granth') // Collection name (e.g., 'godmantra')
        .doc('FOMWPu83VhM2LuYIhgPZ').collection(collectionName).doc(documentId)
        .get();

    if (mantraDocSnapshot.exists) {
      // Check if the document exists
      // Assuming the field name is 'fieldName' in your document
      return mantraDocSnapshot.data()?[fieldName];
    } else {
      // Document does not exist
      return null;
    }
  } catch (error) {
    // Error occurred
    print('Error fetching mantra text: $error');
    return null;
  }
}
