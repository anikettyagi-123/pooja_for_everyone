import 'dart:ui';

import 'package:animated_text_kit/animated_text_kit.dart';

import 'package:flutter/material.dart';
import 'package:pooja_for_everyone/utils.dart';



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
      body: SafeArea(
          child: Stack(
            children: [
              Column(
                      children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * .015,
              ),
              Container(
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * .2),
                          child: const Center(
                            child: Text(
                              'आज का मंत्र',
                              style: (TextStyle(fontSize: 18)),
                            ),
                          ),
                        ),
                        const Icon(
                          Icons.g_translate_sharp,
                          color: Colors.grey,
                          size: 30,
                        )
                      ],
                    ),
                    Center(
                      child: AnimatedTextKit(
                        animatedTexts: [
                          TypewriterAnimatedText(godMantra[index],
                              textStyle: const TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.orangeAccent),
                              speed: const Duration(milliseconds: 100))
                        ],
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * .28,
                      width: MediaQuery.of(context).size.width * .97,
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(50)),
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              godImage[index],
                              fit: BoxFit.fill,
                              height: MediaQuery.of(context).size.height,
                              width: MediaQuery.of(context).size.width,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .012,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Stack(
                    children: [
                      Card(
                        color: Colors.grey.shade300,
                        elevation: 10,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20.0),
                            topRight: Radius.circular(20.0),
                          ),
                        ),
                        child: Column(
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height * .03,
                            ),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Reusebale_Container(
                                  imagePath:
                                      'https://content.jdmagicbox.com/comp/chandigarh/r9/0172px172.x172.201102213540.f3r9/catalogue/best-pandit-ji-chandigarh-namami-astro--chandigarh-chandigarh-astrologers-62den9a9or.jpg',
                                  Name: 'Pandit ji',
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
                                  Color: Colors.black,
                                  imagePath:
                                      'https://st.depositphotos.com/2235295/2458/i/450/depositphotos_24589939-stock-photo-hindu-om-symbol.jpg',
                                  Name: 'Mantra',
                                ),
                                Reusebale_Container(
                                  imagePath:
                                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRwU_aVpjfqT1FxHZjpyq2ManFJ7477fKtG9Q&usqp=CAU',
                                  Name: 'Samagrhi',
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
                                  'https://files.prokerala.com/calendar/images/en/hindu-calendar-2024-november.png',
                                  Name: 'Hindu Calender & Varat',
                                ),
                                Reusebale_Container(
                                  imagePath:
                                      'https://qph.cf2.quoracdn.net/main-qimg-a1825aa13d8b6ef80151763b881147b4-lq',
                                  Name: 'Hindu Granth',
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
                                      'https://www.prabhatkhabar.com/wp-content/uploads/2024/02/3-ayodhya-ram-mandir.jpg',
                                  Name: 'Tradtional Places',
                                ),
                                Reusebale_Container(
                                  imagePath:
                                      'https://substackcdn.com/image/fetch/w_1456,c_limit,f_webp,q_auto:good,fl_progressive:steep/https%3A%2F%2Fbucketeer-e05bbc84-baa3-437e-9518-adb32be77984.s3.amazonaws.com%2Fpublic%2Fimages%2Fc0e2e782-44d9-4171-83bc-c5bb8cf36505_940x788.png',
                                  Name: 'Mantra',
                                ),
                              ],
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * .2,
                            ),

                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
                      ],

                    ),

              Center(
                child: Padding(
                  padding:  EdgeInsets.only(top:MediaQuery.of(context).size.height*.85),
                  child: 
                  ClipRect(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                      child:
                      Container(
                        height: MediaQuery.of(context).size.height*.06,
                        width: MediaQuery.of(context).size.width*.9,
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(.01),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.black,width: 1.5)
                        ),
                        child:const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [

                           Icon(Icons.more_vert_outlined,size: 30,),
                            Icon(Icons.home,size: 30,),
                           Icon(Icons.shopping_cart,size: 30,),
                            Icon((Icons.headset_mic))
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),

            ],
          )),
    );
  }
}
