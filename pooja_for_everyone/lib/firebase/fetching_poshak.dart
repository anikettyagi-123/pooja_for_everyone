
import 'package:cloud_firestore/cloud_firestore.dart';

Future<List<Map<String,dynamic>>?>fetchingPoshak() async{
  try{
    QuerySnapshot<Map<String,dynamic>> newQuery= await
        FirebaseFirestore.instance.collection('poshak').orderBy('uploadedAt',descending: true).get();
    if (newQuery.docs.isNotEmpty) {

      List<Map<String, dynamic>> poshakList = newQuery.docs.map((doc) {
        Map<String, dynamic> data = doc.data();
        data['id'] = doc.id;
        return data;
      }).toList();

      return poshakList;
    }else {
      return null;
    }
    
  }catch(error){
    return null;
  }
  
}

