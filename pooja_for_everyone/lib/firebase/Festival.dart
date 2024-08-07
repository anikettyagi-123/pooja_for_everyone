
import 'package:cloud_firestore/cloud_firestore.dart';


Future<String?> getFestivalText( String fieldName) async {
  try {
    // Fetch document from Firestore
    DocumentSnapshot<Map<String, dynamic>> mantraDocSnapshot =
    await FirebaseFirestore.instance
        .collection('Festival Pooja') // Collection name (e.g., 'godmantra')
        .doc('KqhBwjeI5zOcCC1XAaN1')
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
  //  print('Error fetching mantra text: $error');
    return null;
  }
}
