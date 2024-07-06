import 'package:cloud_firestore/cloud_firestore.dart';

Future<Map<String, dynamic>?>  fetchCalender() async {
  try {
    DocumentSnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore.instance
        .collection('calender')
        .doc('XVwQXy2847HK8kd5uIwQ')
        .get();
    if (snapshot.exists) {
      Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
      return data;
    } else {
      return null;
    }
  } catch (error) {
    // Handle errors if any
    return null;
  }
}
