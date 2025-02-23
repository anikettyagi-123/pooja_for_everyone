


import 'package:get/get.dart';

import '../firebase/fetching_poshak.dart';

class PoshakController extends GetxController{
 var isloading = true.obs;
 var poshakList=  <Map<String,dynamic>>[].obs;
 @override
 void onInit() {
   super.onInit();
  // fetchingPoshak(); // Fetch address initially
 }

  void fetchPoshak()async{
    try{
      isloading(true);
      List<Map<String,dynamic>>? fetch = await fetchingPoshak();
      if(fetch != null && fetch.isNotEmpty){
        poshakList.value = fetch;
      }else{
        poshakList.clear();
      }

    }finally{
      isloading(false);
    }

  }
}
