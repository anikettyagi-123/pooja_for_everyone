import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:pooja_for_everyone/controller/cart_controller.dart';
import 'package:pooja_for_everyone/global/Utils.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    final cartController = Get.put(CartController());
    cartController.fetchingCart();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        automaticallyImplyLeading: false,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * .025,
          ),
          Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * .8,
              child: ElevatedButton(
                onPressed: () {
                  if(cartController.itemCount.value==0){
                    Utils().toastMessage('Please select an item first');
                  }
                },
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all<Color>(Colors.amberAccent),
                ),
                child: Obx(()=> Text(
                  'Click to Buy all Item(${cartController.itemCount})',
                  style: TextStyle(fontSize: 15, color: Colors.black),
                )),
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * .015,
          ),
         Padding(
           padding: const EdgeInsets.only(left: 8.0),
           child:Obx(()=> Text('Subtotal ${cartController.totalPrice.value.toStringAsFixed(2)}',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),)),
         ),
         const  Divider(),
           Padding(
            padding:const  EdgeInsets.all(8.0),
            child: GestureDetector(
             onTap: (){
               bool allSelected = cartController.selectedItems.contains(true);
               cartController.toggleSelectAll(allSelected);
               cartController.totalPriceCalculation();
             },
              child:const  Text(
                'Select all Item',
                style: TextStyle(color: Colors.lightBlue),
              ),
            ),
          ),
          Expanded(
            child: Obx(() {
              if (cartController.isLoading.value) {
                return Center(child:
                Lottie.asset('animation/wait.json',
                  height: MediaQuery.of(context).size.height*15,
                  width: MediaQuery.of(context).size.width*30
                ));
                  //const Center(child: CircularProgressIndicator());
              } else if (cartController.cartList.isEmpty) {
                return const  Center(
                  child: Text(
                    'No Item added',
                    style: TextStyle(color: Colors.black),
                  ),
                );
              } else {
                return ListView.builder(
                  itemCount: cartController.cartList.length,
                  itemBuilder: (context, index) {
                    Map<String, dynamic> item = cartController.cartList[index];
                    return Column(
                      children: [
                        Stack(
                          children: [
                            Container(
                              color: Colors.grey.shade100,
                              height: MediaQuery.of(context).size.height * .25,
                              width: MediaQuery.of(context).size.width * .97,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    child: CachedNetworkImage(
                                      imageUrl: item['downloadLink'],
                                      height: MediaQuery.of(context).size.height * .3,
                                      width: MediaQuery.of(context).size.width * .52,
                                      fit: BoxFit.contain,
                                      errorWidget: (context, url, error) =>
                                      const Center(child: Text('Error loading image')),
                                    ),
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width * .03,
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: MediaQuery.of(context).size.height * .01,
                                        ),
                                        Text(
                                          item['heading'],
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          height: MediaQuery.of(context).size.height * .001,
                                        ),
                                        Text(
                                          item['description'],
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        Text(
                                          '${item['actualPrice']}.00',
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(fontSize: 21, fontWeight: FontWeight.w600),
                                        ),
                                        Text(
                                          'delivery in 2-3 days',
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(color: Colors.grey.shade600),
                                        ),
                                        const Text(
                                          'In stock',
                                          style: TextStyle(color: Colors.green),
                                        ),
                                        const Text(
                                          '8 days Replace & Return',
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 2,
                                        ),
                                        SizedBox(
                                          height: MediaQuery.of(context).size.height * .0002,
                                        ),
                                        Expanded(
                                          child: Row(
                                            children: [
                                              Expanded(
                                                child: Container(
                                                  height: MediaQuery.of(context).size.height * .046,
                                                  width: MediaQuery.of(context).size.width * .30,
                                                  decoration: BoxDecoration(
                                                    color: Colors.grey.shade300,
                                                    borderRadius: BorderRadius.circular(6),
                                                  ),
                                                  child: Row(
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                    children: [
                                                      GestureDetector(
                                                        onTap: () {
                                                          cartController.decrementQuantity(index);
                                                        },
                                                        child: const Text(
                                                          '–',
                                                          style: TextStyle(fontSize: 30),
                                                        ),
                                                      ),
                                                      Container(
                                                        height: MediaQuery.of(context).size.height * .043,
                                                        width: MediaQuery.of(context).size.width * .10,
                                                        color: Colors.white,
                                                        child: Center(
                                                          child: Text(
                                                            item['quantity'].toString(),
                                                            style: TextStyle(fontSize: 18),
                                                            overflow: TextOverflow.ellipsis,
                                                          ),
                                                        ),
                                                      ),
                                                      GestureDetector(
                                                        onTap: () {
                                                          cartController.incrementQuantity(index);
                                                        },
                                                        child: const Text(
                                                          '+',
                                                          style: TextStyle(fontSize: 30),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              IconButton(
                                                onPressed: () {


                                                },
                                                icon: Icon(Icons.delete),
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Positioned(
                             top: MediaQuery.of(context).size.height*.0000001,
                              left:  MediaQuery.of(context).size.height*.185,
                              child: Obx(
                                    () => Checkbox(
                                  value: cartController.selectedItems[index],
                                  onChanged: (value) {
                                    cartController.toggleItemSelection(index, value!);
                                    cartController.totalPriceCalculation();


                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .015,
                        ),
                      ],
                    );
                  },
                );
              }
            }),
          ),
        ],
      ),
    );
  }
}
