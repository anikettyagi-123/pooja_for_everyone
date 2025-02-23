

import 'package:get/get.dart';

import '../firebase/cart/adding_cart_data.dart';
import '../firebase/cart/fetching_data_cart.dart';

class CartController extends GetxController {

  var isLoading = true.obs;
  var cartList = <Map<String, dynamic>>[].obs;
 // var quantity = 1;
  var totalPrice = 0.0.obs;
  RxList<bool> selectedItems = <bool>[].obs;
  var itemCount = 0.obs;


 // var quantity = 1.obs;
  void incrementQuantity(int index) async{
    var item = cartList[index];
   item['quantity']++;
    // Update the quantity in Firestore
    updateQuantity(item['id'],item['quantity'],item['actualPrice']);

    await fetchingCart();


    totalPriceCalculation();
  }

  void decrementQuantity(int index) async {
    var item = cartList[index];
    if (item['quantity'] > 1) {
      item['quantity']--; // Decrement the quantity if greater than 1

      // Update the quantity in Firestore
      await updateQuantity(item['id'], item['quantity'], item['actualPrice']);

      // Re-fetch the cart items from Firestore to ensure updated prices
      await fetchingCart();

      // Recalculate the total price after fetching updated items
      totalPriceCalculation();
    }
  }

 Future<void> fetchingCart() async {
    try {
      isLoading(true);
      List<Map<String, dynamic>>? cart = await fetchCartItems();
      if (cart.isNotEmpty) {
        cartList.value = cart;
      } else {
        cartList.clear();
      }
    }  finally {
      selectedItems.value = List<bool>.filled(cartList.length, false);
      isLoading(false);
    }
  }
  Future<void> toggleSelectAll(bool value) async {
    selectedItems.value = List<bool>.filled(cartList.length, true);
    itemCount.value = true? cartList.length:0;
  }
  void toggleItemSelection(int index, bool value) {
    selectedItems[index] = value;
    if(value){
      itemCount.value++;
    }else{
      itemCount.value--;
    }


  }
  void totalPriceCalculation(){
    double total = 0.0;
    for(int i =0 ; i<cartList.length; i++){
      if(selectedItems[i]){
        total += double.parse(cartList[i]['price']);
      }
    }
    totalPrice.value = total;

  }
  void totalItemCount(){

  }


}

