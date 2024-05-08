
import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

Future<String?> getMantraText(String collectionName, String documentId, String fieldName) async {
  try {
    // Fetch document from Firestore
    DocumentSnapshot<Map<String, dynamic>> mantraDocSnapshot =
    await FirebaseFirestore.instance
        .collection('godmantra') // Collection name (e.g., 'godmantra')
        .doc('LEIPpqoCGGGZVo2dMTTs').collection(collectionName).doc(documentId) // Document ID inside the specified collection
        .get();

    if (mantraDocSnapshot.exists) {
      // Document exists, get URL field
      String? textUrl = mantraDocSnapshot.data()?[fieldName]; // Use the provided field name
      if (textUrl != null) {
        // Fetch text content from Firebase Storage
        final response = await FirebaseStorage.instance.refFromURL(textUrl).getData();
        if (response != null) {
          // Convert Uint8List to Iterable<int> and then decode it to string
          final textContent = utf8.decode(response);
          return textContent;
        }
      }
    }
    // Document does not exist or URL is null
    return null;
  } catch (error) {
    // Error occurred
    print('Error fetching mantra text: $error');
    return null;
  }
}
