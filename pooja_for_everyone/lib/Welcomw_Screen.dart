import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pooja_for_everyone/utils.dart';

import 'appbar.dart';

class Welcome_Screen extends StatelessWidget {
  Welcome_Screen({super.key});

  final List<String> godImage = [
    'assets/monday.jpg',
    'assets/tuesday.jpg',
    'assets/wednesday.jpg',
    'assets/thrusday.jpg',
    'assets/friday.jpg',
    'assets/saturday.jpg',
    'assets/sunday.jpg',
  ];
  final List<String> godMantra = [
    'ॐ नमः शिवाय',
    "ॐ हं हनुमते नमः",
    "ॐ गं गणपतये नमः",
    "ॐ नमो भगवते वासुदेवाय",
    "ॐ श्रीं ह्रीं क्लीं ऐं लक्ष्म्यै नमः",
    "ॐ शं शनैश्चराय नमः",
    "ॐ आदित्याय नमः"




  ];

  int _getCurrentDayOfWeek() {
    DateTime now = DateTime.now();
    return now.weekday;
  }

  @override
  Widget build(BuildContext context) {
    int currentDay = _getCurrentDayOfWeek();

    int index = currentDay - 1;
    return Scaffold(
     
      // appBar: PreferredSize(
      //   preferredSize: MediaQuery.of(context).size * .1,
      //   child: AppBar(
      //     backgroundColor: Colors.white,
      //     title: Padding(
      //       padding: const EdgeInsets.only(
      //         top: 33,
      //       ),
      //       child: Text(
      //         'Category',
      //         style: TextStyle(fontSize: 20),
      //       ),
      //     ),
      //     actions: [
      //       Padding(
      //         padding: const EdgeInsets.only(top: 26.0, right: 20),
      //         child:
      //             IconButton(onPressed: () {}, icon: Icon(Icons.shopping_cart)),
      //       )
      //     ],
      //   ),
      // ),
      body: SafeArea(
          child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * .015,
          ),
          Center(
            child: AnimatedTextKit(
              animatedTexts: [
                TypewriterAnimatedText(godMantra[index],
                  textStyle: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                      color: Colors.orangeAccent),

                )],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * .30,
            width: MediaQuery.of(context).size.width * .97,
            decoration: BoxDecoration(
                color: Colors.grey, borderRadius: BorderRadius.circular(50)),
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(godImage[index],fit: BoxFit.cover,
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                  ),
                ),

              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * .03,
            
          ),
          Expanded(
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
                      Reusebale_Container(
                        imagePath:
                            'https://inventory.rudra-centre.org/static/images/blogs/havan+kund.jpg',
                        Name: 'Pooja',
                      ),
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
                      Reusebale_Container(
                        imagePath:
                            'https://substackcdn.com/image/fetch/w_1456,c_limit,f_webp,q_auto:good,fl_progressive:steep/https%3A%2F%2Fbucketeer-e05bbc84-baa3-437e-9518-adb32be77984.s3.amazonaws.com%2Fpublic%2Fimages%2Fc0e2e782-44d9-4171-83bc-c5bb8cf36505_940x788.png',
                        Name: 'Mantra',
                      ),
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
                      Reusebale_Container(
                        imagePath:
                            'https://substackcdn.com/image/fetch/w_1456,c_limit,f_webp,q_auto:good,fl_progressive:steep/https%3A%2F%2Fbucketeer-e05bbc84-baa3-437e-9518-adb32be77984.s3.amazonaws.com%2Fpublic%2Fimages%2Fc0e2e782-44d9-4171-83bc-c5bb8cf36505_940x788.png',
                        Name: 'Mantra',
                      ),
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
                      Reusebale_Container(
                        imagePath:
                            'https://substackcdn.com/image/fetch/w_1456,c_limit,f_webp,q_auto:good,fl_progressive:steep/https%3A%2F%2Fbucketeer-e05bbc84-baa3-437e-9518-adb32be77984.s3.amazonaws.com%2Fpublic%2Fimages%2Fc0e2e782-44d9-4171-83bc-c5bb8cf36505_940x788.png',
                        Name: 'Mantra',
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .02,
                  ),
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }
}
