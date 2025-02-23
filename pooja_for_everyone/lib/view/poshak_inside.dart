import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:pooja_for_everyone/controller/poshak_inside_controller.dart';

import '../controller/cart_controller.dart';
import '../controller/poshak_controller.dart';
import '../firebase/cart/adding_cart_data.dart';
import '../global/appbar.dart';

class PoshakInsideView extends StatelessWidget {
  final String documentId;

  const PoshakInsideView({super.key, required this.documentId});

  @override
  Widget build(BuildContext context) {
    final poshakInsideController = Get.put(PoshakInsideController());
    final poshakController = Get.put(PoshakController());

    poshakInsideController.documentId = documentId;

    // Ensure fetchPoshakInside is called once the documentId is set.
    poshakInsideController.fetchPoshakInside();
  //  poshakController.fetchPoshak();

    return Scaffold(
      appBar: MyAppbar(),
      body: Obx(() {
        if (poshakInsideController.isloading.value) {
          return Center(
            child: Lottie.asset(
              'animation/loading.json',
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width * 0.5,
            ),
          );
        } else if (poshakInsideController.poshakInsideList.isEmpty) {
          return const Center(
            child: Text(
              'No Item added',
              style: TextStyle(color: Colors.black),
            ),
          );
        } else {
          List<dynamic> additionalImages =
              poshakInsideController.poshakInsideList['additionalImages'] ?? [];
          List<dynamic> moreSize =
              poshakInsideController.poshakInsideList['moreSize'] ?? [];
          String heading =
              poshakInsideController.poshakInsideList['heading'] ?? '';
          String description =
              poshakInsideController.poshakInsideList['description'] ?? '';
          String discount =
              poshakInsideController.poshakInsideList['discount'] ?? '';
          String insideDescription =
              poshakInsideController.poshakInsideList['insideDescription'] ??
                  '';
          String actualPrice =
              poshakInsideController.poshakInsideList['actualPrice'] ?? '';
          String originalPrice =
              poshakInsideController.poshakInsideList['originalPrice'] ?? '';
          String specification =
              poshakInsideController.poshakInsideList['specification'] ?? '';
          String initialSize =
              poshakInsideController.poshakInsideList['initialSize'] ?? '';
          String initialColor =
              poshakInsideController.poshakInsideList['initialColor'] ?? '';

          return Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      color: Colors.grey.shade100,
                      // height: MediaQuery.of(context).size.height ,// Adjust height as needed
                      // width: MediaQuery.of(context).size.width,

                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0, top: 8),
                            child: Text(
                              heading,
                              style:
                                  TextStyle(fontSize: 18, color: Colors.blue),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(description),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 8.0, top: 8, bottom: 8),
                            child: Container(
                                height: MediaQuery.of(context).size.height *
                                    .05, // Adjust height as needed
                                width: MediaQuery.of(context).size.width * .140,
                                decoration: BoxDecoration(
                                    color: Colors.red.shade700,
                                    shape: BoxShape.circle
                                    // borderRadius: BorderRadius.circular(300)
                                    ),
                                child: Center(
                                  child: Text(
                                    discount,
                                    style: TextStyle(
                                        fontSize: 17, color: Colors.white),
                                  ),
                                )),
                          ),
                          Center(
                            child: Column(
                              children: [
                                Container(
                                  //color: Colors.grey.shade200,
                                  height: MediaQuery.of(context).size.height *
                                      0.33, // Adjust height as needed
                                  width:
                                      MediaQuery.of(context).size.width * .85,
                                  child: PageView.builder(
                                    itemCount: additionalImages.length,
                                    onPageChanged: (index) =>
                                        poshakInsideController
                                            .imageIndex(index),
                                    itemBuilder: (context, index) {
                                      return ClipRRect(
                                        borderRadius: BorderRadius.circular(6),
                                        child: CachedNetworkImage(
                                          imageUrl: additionalImages[index],

                                          fit: BoxFit.contain,
                                          // Ensures the image covers the container
                                          placeholder: (context, url) =>
                                              const Center(
                                                  child:
                                                      CircularProgressIndicator()),
                                          errorWidget: (context, url, error) =>
                                              const Icon(Icons.error),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                Obx(() => Text(
                                      '${poshakInsideController.picIndex.value + 1}/${additionalImages.length}',
                                      // Dynamic counter
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.grey),
                                    )),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * .08,
                          ),
                          const Divider(
                            thickness: 2,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 8.0, bottom: 8),
                            child: Text(
                              'Size ',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 8.0, left: 8),
                                  child: GestureDetector(
                                    onTap: () {
                                      poshakInsideController.updateIndex(0);
                                    },
                                    child: Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              .06, // Adjust height as needed
                                      width: MediaQuery.of(context).size.width *
                                          .25,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                            color: poshakInsideController
                                                        .selectedIndex.value ==
                                                    0
                                                ? Colors
                                                    .green // Green border if selected
                                                : Colors.grey,
                                            // Grey border otherwise
                                            width: 2,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: Colors.grey.shade300),
                                      child: Center(
                                          child: Text('Size $initialSize',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 17))),
                                    ),
                                  ),
                                ),
                                Row(
                                  children:
                                      List.generate(moreSize.length, (index) {
                                    return Padding(
                                      padding:
                                          const EdgeInsets.only(right: 8.0),
                                      child: GestureDetector(
                                        onTap: () {
                                          poshakInsideController
                                              .updateIndex(index + 1);
                                          int selectedSize =
                                              int.parse(moreSize[index]);
                                          poshakInsideController
                                              .updatePrice(selectedSize);
                                          // poshakInsideController.updateOriginalPrice(selectedSize);
                                          print(selectedSize);
                                        },
                                        child: Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              .06, // Adjust height as needed
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              .25,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                color: poshakInsideController
                                                            .selectedIndex
                                                            .value ==
                                                        index + 1
                                                    ? Colors
                                                        .green // Green border if selected
                                                    : Colors.grey,
                                                // Grey border otherwise
                                                width: 2,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              color: Colors.grey.shade300),
                                          child: Center(
                                              child: Text(
                                            'Size ${moreSize[index]}',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 17),
                                          )),
                                        ),
                                      ),
                                    );
                                  }),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                              height: MediaQuery.of(context).size.height * .02),
                          Divider(),
                          const Divider(
                            thickness: 2,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 8.0, bottom: 8),
                            child: Text(
                              'Color',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 8.0, left: 8),
                                  child: Container(
                                    height: MediaQuery.of(context).size.height *
                                        .06, // Adjust height as needed
                                    width:
                                        MediaQuery.of(context).size.width * .25,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                          color: poshakInsideController
                                                      .selectedIndexColor
                                                      .value ==
                                                  0
                                              ? Colors
                                                  .green // Green border if selected
                                              : Colors.grey,
                                          // Grey border otherwise
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(5),
                                        color: Colors.grey.shade300),
                                    child: Center(
                                        child: Text(initialColor,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 17))),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                              height: MediaQuery.of(context).size.height * .02),
                          Divider(),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Container(
                              height: MediaQuery.of(context).size.height * .034,
                              width: MediaQuery.of(context).size.width * .3,
                              decoration: BoxDecoration(
                                  color: Colors.red.shade700,
                                  borderRadius: BorderRadius.circular(5)),
                              child: const Center(
                                  child: Text(
                                'Limited time deal',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold),
                              )),
                            ),
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Text(
                                  discount,
                                  style: TextStyle(
                                      fontSize: 35,
                                      color: Colors.red,
                                      fontWeight: FontWeight.w300),
                                ),
                              ),
                              Obx(() =>
                                  poshakInsideController.selectedIndex.value ==
                                          0
                                      ? Text(
                                          ' ₹$actualPrice',
                                          style: TextStyle(
                                              fontSize: 35,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500),
                                        )
                                      : Text(
                                          ' ₹${poshakInsideController.initialPrice}',
                                          style: TextStyle(
                                              fontSize: 35,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500),
                                        ))
                            ],
                          ),
                          Obx(() => Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child:
                                  poshakInsideController.selectedIndex.value ==
                                          0
                                      ? Text(
                                          // originalPrice,
                                          'M.R.P:₹${originalPrice.trim()}.00',
                                          style: const TextStyle(
                                              decoration:
                                                  TextDecoration.lineThrough),
                                        )
                                      : Text(
                                          'M.R.P:₹${poshakInsideController.originalPrice}.00',
                                          style: const TextStyle(
                                              decoration:
                                                  TextDecoration.lineThrough),
                                        ))),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'The offer is valid for limited period of time only:-',
                              style: TextStyle(fontStyle: FontStyle.italic),
                            ),
                          ),
                          Divider(),
                          int.parse(actualPrice) > 300
                              ? Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          FaIcon(
                                            FontAwesomeIcons.truck,
                                            color: Colors.grey,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              'FREE delivery in 48 hours (within 2 days)',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          FaIcon(
                                            FontAwesomeIcons.arrowRotateLeft,
                                            color: Colors.grey,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              '10 days Returnable',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.currency_rupee_rounded,
                                            color: Colors.grey,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              'Cash/Pay on delivery',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                )
                              : Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      Text(
                                        'Delivery Charges Applicable order below rs 300 ',
                                        style: TextStyle(
                                            fontStyle: FontStyle.italic),
                                      ),
                                      Row(
                                        children: [
                                          FaIcon(
                                            FontAwesomeIcons.truck,
                                            color: Colors.grey,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              'Delivery in 48 hours (within 2 days)',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          FaIcon(
                                            FontAwesomeIcons.arrowRotateLeft,
                                            color: Colors.grey,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              '10 days Returnable',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.currency_rupee_rounded,
                                            color: Colors.grey,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              'Cash/Pay on delivery',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                          Divider(),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "You might also like",
                              style: TextStyle(
                                  fontSize: 21, fontWeight: FontWeight.bold),
                            ),
                          ),
                          // Obx(() {
                          //   if (poshakController.isloading.value) {
                          //     return Center(child: Text('Loading....'));
                          //   } else if (poshakController.poshakList.isEmpty) {
                          //     return Center(
                          //         child: Text('No poshaks found',
                          //             style: TextStyle(color: Colors.black)));
                          //   } else {
                          //     return ListView.builder(
                          //         scrollDirection: Axis.horizontal,
                          //         itemCount: poshakController.poshakList.length,
                          //         itemBuilder: (context, index) {
                          //           Map<String, dynamic> item =
                          //               poshakController.poshakList[index];
                          //           return Column(
                          //             children: [
                          //               Container(
                          //                 child: ClipRRect(
                          //                   child: CachedNetworkImage(
                          //                     imageUrl: item['downloadLink'],
                          //                     height: MediaQuery.of(context)
                          //                             .size
                          //                             .height *
                          //                         .25,
                          //                     width: MediaQuery.of(context)
                          //                             .size
                          //                             .width *
                          //                         .48,
                          //                     fit: BoxFit.contain,
                          //                     errorWidget: (context, url,
                          //                             error) =>
                          //                         const Center(
                          //                             child: Text(
                          //                                 'Error loading image')),
                          //                   ),
                          //                 ),
                          //               )
                          //             ],
                          //           );
                          //         });
                          //   }
                          // }),
                          Divider(),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Dress details :-',
                              style: TextStyle(fontSize: 25),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(
                              insideDescription,
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                          Divider(),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Dress Specification :-',
                              style: TextStyle(fontSize: 25),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(
                              specification,
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * .13,
                          ),
                          Divider(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  color: Colors.grey.shade300,
                  height: MediaQuery.of(context).size.height * .08,
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          cartData(documentId, actualPrice);
                        },
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height * .08,
                          width: MediaQuery.of(context).size.width * .50,
                          child: Center(
                              child: Text(
                            'Add to Cart',
                            style: TextStyle(fontSize: 17),
                          )),
                        ),
                      ),
                      Container(
                        color: Colors.amber,
                        height: MediaQuery.of(context).size.height * .08,
                        width: MediaQuery.of(context).size.width * .50,
                        child: Center(
                            child: Text('Buy Now',
                                style: TextStyle(fontSize: 17))),
                      ),
                    ],
                  ),
                ),
              )
            ],
          );
        }
      }),
    );
  }
}
