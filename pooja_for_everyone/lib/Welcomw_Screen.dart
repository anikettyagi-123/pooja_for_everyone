import 'package:flutter/material.dart';
import 'package:pooja_for_everyone/utils.dart';

class Welcome_Screen extends StatelessWidget {
  const Welcome_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: MediaQuery.of(context).size * .1,
        child: AppBar(
          backgroundColor: Colors.white,
          title: Padding(
            padding: const EdgeInsets.only(
              top: 33,
            ),
            child: Text(
              'Category',
              style: TextStyle(fontSize: 20),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(top: 26.0, right: 20),
              child:
                  IconButton(onPressed: () {}, icon: Icon(Icons.shopping_cart)),
            )
          ],
        ),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Reusebale_Container(
                  imagePath:
                      'https://substackcdn.com/image/fetch/w_1456,c_limit,f_webp,q_auto:good,fl_progressive:steep/https%3A%2F%2Fbucketeer-e05bbc84-baa3-437e-9518-adb32be77984.s3.amazonaws.com%2Fpublic%2Fimages%2Fc0e2e782-44d9-4171-83bc-c5bb8cf36505_940x788.png',

                  Name: 'Mantra',
                ),
                Reusebale_Container(imagePath: 'https://inventory.rudra-centre.org/static/images/blogs/havan+kund.jpg', Name: 'Pooja',),

              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .02,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Reusebale_Container(
                  imagePath:
                  'https://substackcdn.com/image/fetch/w_1456,c_limit,f_webp,q_auto:good,fl_progressive:steep/https%3A%2F%2Fbucketeer-e05bbc84-baa3-437e-9518-adb32be77984.s3.amazonaws.com%2Fpublic%2Fimages%2Fc0e2e782-44d9-4171-83bc-c5bb8cf36505_940x788.png',

                  Name: 'Mantra',
                ),
                Reusebale_Container(imagePath: 'https://substackcdn.com/image/fetch/w_1456,c_limit,f_webp,q_auto:good,fl_progressive:steep/https%3A%2F%2Fbucketeer-e05bbc84-baa3-437e-9518-adb32be77984.s3.amazonaws.com%2Fpublic%2Fimages%2Fc0e2e782-44d9-4171-83bc-c5bb8cf36505_940x788.png', Name: 'Mantra',),

              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .02,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Reusebale_Container(
                  imagePath:
                  'https://substackcdn.com/image/fetch/w_1456,c_limit,f_webp,q_auto:good,fl_progressive:steep/https%3A%2F%2Fbucketeer-e05bbc84-baa3-437e-9518-adb32be77984.s3.amazonaws.com%2Fpublic%2Fimages%2Fc0e2e782-44d9-4171-83bc-c5bb8cf36505_940x788.png',

                  Name: 'Mantra',
                ),
                Reusebale_Container(imagePath: 'https://substackcdn.com/image/fetch/w_1456,c_limit,f_webp,q_auto:good,fl_progressive:steep/https%3A%2F%2Fbucketeer-e05bbc84-baa3-437e-9518-adb32be77984.s3.amazonaws.com%2Fpublic%2Fimages%2Fc0e2e782-44d9-4171-83bc-c5bb8cf36505_940x788.png', Name: 'Mantra',),

              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .02,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Reusebale_Container(
                  imagePath:
                  'https://substackcdn.com/image/fetch/w_1456,c_limit,f_webp,q_auto:good,fl_progressive:steep/https%3A%2F%2Fbucketeer-e05bbc84-baa3-437e-9518-adb32be77984.s3.amazonaws.com%2Fpublic%2Fimages%2Fc0e2e782-44d9-4171-83bc-c5bb8cf36505_940x788.png',

                  Name: 'Mantra',
                ),
                Reusebale_Container(imagePath: 'https://substackcdn.com/image/fetch/w_1456,c_limit,f_webp,q_auto:good,fl_progressive:steep/https%3A%2F%2Fbucketeer-e05bbc84-baa3-437e-9518-adb32be77984.s3.amazonaws.com%2Fpublic%2Fimages%2Fc0e2e782-44d9-4171-83bc-c5bb8cf36505_940x788.png', Name: 'Mantra',),

              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .02,
            ),
          ],
        ),
      )),
    );
  }
}
