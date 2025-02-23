import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:pooja_for_everyone/view/poshak_inside.dart';
import '../../controller/poshak_controller.dart';
import '../../firebase/cart/adding_cart_data.dart';
import '../../global/appbar.dart';

class PoshakPage extends StatelessWidget {

  const PoshakPage({super.key});

  @override
  Widget build(BuildContext context) {
    final poshakController = Get.put(PoshakController());
    poshakController.fetchPoshak(); // Fetch the data when the page loads

    return Scaffold(
      appBar: MyAppbar(),

      body: Obx(() {
        if (poshakController.isloading.value) {
          return Center(child: CircularProgressIndicator());
        } else if (poshakController.poshakList.isEmpty) {
          return Center(child: Text('No poshaks found', style: TextStyle(color: Colors.black)));
        } else {
          // Calculate the number of rows needed, each row contains 2 items
          int rowCount = (poshakController.poshakList.length / 2).ceil();

          return ListView.builder(
            itemCount: rowCount,
            itemBuilder: (context, index) {
              int firstIndex = index * 2;
              int secondIndex = firstIndex + 1;

              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // Display the first poshak in the row
                    Expanded(
                      child: PoshakItem(
                        poshak: poshakController.poshakList[firstIndex],
                      ),
                    ),
                    SizedBox(width: 8), // Space between the two items
                    // Display the second poshak in the row, only if it exists
                    if (secondIndex < poshakController.poshakList.length)
                      Expanded(
                        child: PoshakItem(
                          poshak: poshakController.poshakList[secondIndex],
                        ),
                      ),
                    if (secondIndex >= poshakController.poshakList.length)
                      Spacer(), // To balance the row if there's only one item
                  ],
                ),
              );
            },
          );
        }
      }),
    );
  }
}

class PoshakItem extends StatelessWidget {
  final Map<String, dynamic> poshak;

  const PoshakItem({super.key, required this.poshak});

  @override
  Widget build(BuildContext context) {
    String imageUrl = poshak['downloadLink'] ?? ''; // Adjust this key based on your data
    String poshakName = poshak['heading'] ?? 'Poshak';
    String description = poshak['description']??'';
    String discount = poshak['discount']??'';
    String actualPrice = poshak['actualPrice']??'';
    String originalPrice = poshak['originalPrice']??'';
    String poshakId = poshak['id']??'';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [


        GestureDetector(
          onTap: (

              ){
            Get.to(()=>PoshakInsideView(documentId: poshakId,));
          },
          child: Container(
            height: MediaQuery.of(context).size.height*.4,
            width: MediaQuery.of(context).size.width*45,
          
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(6)
              
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(topRight:Radius.circular(6),topLeft: Radius.circular(6)),
          
          
                  child: CachedNetworkImage(
                    imageUrl: imageUrl,
                    height:  MediaQuery.of(context).size.height*.2,
                    width: MediaQuery.of(context).size.width*5,
                    
                    fit: BoxFit.cover,
                    errorWidget: (context, url, error) => const Center(
                      child: Text('Error loading image'),
                    ),
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  poshakName,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),overflow: TextOverflow.ellipsis ,
                ),
                Text(description,style: TextStyle(fontSize: 14,),overflow: TextOverflow.ellipsis,),
                Row(
                  children: [
                    Text(discount,style: TextStyle(fontSize: 23,color: Colors.red),),
                    SizedBox(
                      width:MediaQuery.of(context).size.width * .01,
                    ),
                    Text('₹$actualPrice',style: TextStyle(fontSize: 23,fontWeight: FontWeight.w400),),
                  ],
                ),
          
                Text('M.R.P:₹${originalPrice}.00',style: TextStyle(fontSize: 12, decoration: TextDecoration.lineThrough,),),
                SizedBox(
                  height: MediaQuery.of(context).size.height*.01,
                ),
                Center(
                  child: SizedBox(
          
                      width: MediaQuery.of(context).size.width * .4,
                      child: ElevatedButton(onPressed: (){
                        cartData(poshakId,actualPrice);
          
          
          
          
                      },
                        style: ButtonStyle(backgroundColor: WidgetStateProperty.all<Color>(Colors.amberAccent),), child: Text('Add to Cart',style: TextStyle(fontSize: 15,color: Colors.black), ),
                      )),
                )
          
              ],
            ),
          ),
        ),

      ],
    );
  }
}
