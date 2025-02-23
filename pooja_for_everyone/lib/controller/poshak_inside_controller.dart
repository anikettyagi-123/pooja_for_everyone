


import 'dart:math';

import 'package:get/get.dart';

import '../firebase/poshakInside.dart';

class PoshakInsideController extends GetxController{
  var isloading = true.obs;

  var poshakInsideList = <String, dynamic>{}.obs;


  late String documentId;
  var selectedIndex = 0.obs;
  var picIndex = 0.obs;
  var selectedIndexColor = 0.obs;
  var initialPrice = 0.obs;
  var initialSize = 0.obs;
  var originalPrice = 0.0.obs;
  var incrementPrice = 30.0.obs;

  void imageIndex(int index){
    picIndex.value = index;
  }

  void updateIndex(int index){
    selectedIndex.value = index;
  }
  void updateColorIndex(int index){
    selectedIndexColor.value = index;
  }
  void updatePrice(int size) {
    // Calculate the price before updating the size
    initialPrice.value = initialPrice.value +
        ((size - initialSize.value) * incrementPrice.value).toInt();
    originalPrice.value = originalPrice.value+((size-initialSize.value)*incrementPrice.value);

    // Now update the initial size
    initialSize.value = size;
  }

  void fetchPoshakInside()async{
    try{
      isloading(true);
      Map<String,dynamic>? fetch = await poshakInside(documentId);
      if(fetch != null && fetch.isNotEmpty){
        poshakInsideList.value = fetch;
        initialPrice.value = int.parse(poshakInsideList['actualPrice']);


        initialSize.value= int.parse(poshakInsideList['initialSize']??'0')??0;
        originalPrice.value = double.tryParse(poshakInsideList['originalPrice'].toString()) ?? 0.0;

      }else{
        poshakInsideList.clear();
      }

    }finally{
      isloading(false);


    }

  }

}
