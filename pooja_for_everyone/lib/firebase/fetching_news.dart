import 'package:cloud_firestore/cloud_firestore.dart';

Future<List<Map<String, dynamic>>?> getNewsList() async {
  try {
    // Fetch news documents from Firestore
    QuerySnapshot<Map<String, dynamic>> newsQuerySnapshot =
    await FirebaseFirestore.instance.collection('news').orderBy('uploadedAt', descending: true).get();

    if (newsQuerySnapshot.docs.isNotEmpty) {
      // Check if there are any documents
      List<Map<String, dynamic>> newsList = newsQuerySnapshot.docs
          .map((doc) => doc.data())
          .toList();
      return newsList;
    } else {
      // No documents found
      return null;
    }
  } catch (error) {
    // Error occurred
    print('Error fetching news: $error');
    return null;
  }
}
