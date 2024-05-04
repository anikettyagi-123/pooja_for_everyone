

//in this page i am taking image from database to to show that in welcome screen
import 'package:cloud_firestore/cloud_firestore.dart';
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


