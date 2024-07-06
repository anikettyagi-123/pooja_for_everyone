import 'dart:ui';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:pooja_for_everyone/view/festival_pooja/festival_pooja.dart';

import 'package:pooja_for_everyone/view/welcome_screen/Welcome_global.dart';


import '../../firebase/welcome_firebase.dart';
import '../../global/costumised aap bar/appbar.dart';

import '../Login_otp/check_user_login.dart';
import '../calender/calender_view.dart';
import '../godMantra/all_god.dart';
import '../language_translator/language_botton_global.dart';
import '../traditional places/traditional_places.dart';


class welcomeScreen extends StatelessWidget {
  welcomeScreen({super.key});


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
                          child:  Center(
                            child: Text(
                              'आज का मंत्र'.tr,
                              style: (TextStyle(fontSize: 18)),
                            ),
                          ),
                        ),
                         TranslatorButton(),

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
                        width: MediaQuery.of(context).size.width * .87,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.4),
                              spreadRadius: 5,
                              blurRadius: 5,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: FutureBuilder(
                          future: getImageOfGodUrls(),
                          builder:
                              (context,  snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return Center(child: CircularProgressIndicator());
                            } else if (snapshot.hasData &&
                                snapshot.data!.isNotEmpty) {
                              return ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child:CachedNetworkImage(
                                  imageUrl: snapshot.data!,
                                  height:MediaQuery.of(context).size.height*.28 ,
                                  width: double.infinity,

                                  fit: BoxFit.fill,
                                  placeholder: (context, url) => const Center(child: CircularProgressIndicator()),

                                )
                              );
                            } else {
                              return Center(child: Text('Loading..'));
                            }
                          },
                        )


                  )],
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
                             Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                reUsebaleContainer(
                                  imagePath:
                                      'https://content.jdmagicbox.com/comp/chandigarh/r9/0172px172.x172.201102213540.f3r9/catalogue/best-pandit-ji-chandigarh-namami-astro--chandigarh-chandigarh-astrologers-62den9a9or.jpg',
                                  name: 'Pandit ji'.tr,
                                  onPressed:  () =>isLogin('Pandit'),


                                ),
                                reUsebaleContainer(
                                  imagePath:
                                      'https://ashtok.com/cdn/shop/products/CopperHavanKundTraditionalPoojaIndian7_1024x1024.jpg?v=1663305758',
                                  name: 'Pooja'.tr,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * .02,
                            ),
                             Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                 reUsebaleContainer(
                                  color: Colors.black,
                                  imagePath:
                                      'https://st.depositphotos.com/2235295/2458/i/450/depositphotos_24589939-stock-photo-hindu-om-symbol.jpg',
                                  name: 'Mantra'.tr,
                                  onPressed: (){
                                    Get.to(()=> AllGod());

                                  },
                                ),
                                reUsebaleContainer(
                                  imagePath:
                                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRwU_aVpjfqT1FxHZjpyq2ManFJ7477fKtG9Q&usqp=CAU',
                                  name: 'Samagrhi'.tr,

                                  onPressed:  () =>
                                      isLogin('Samagrhi'),

                                ),
                              ],
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * .02,
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height * .10,
                              width: MediaQuery.of(context).size.width * .87,
                              decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(5,),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.4),
                                    spreadRadius: 5,
                                    blurRadius: 5,
                                    offset: Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: Image.network('https://www.shutterstock.com/image-vector/hand-holding-om-flag-temple-260nw-2360906707.jpg',fit: BoxFit.cover,),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * .02,
                            ),

                             Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                reUsebaleContainer(
                                  imagePath:
                                  'https://www.prabhatkhabar.com/wp-content/uploads/2024/02/3-ayodhya-ram-mandir.jpg',
                                  name: 'Traditional Places'.tr,
                                  onPressed: (){
                                    Get.to(()=>TraditonalPlaces());
                                  },

                                ),

                                reUsebaleContainer(
                                  imagePath:
                                      'https://qph.cf2.quoracdn.net/main-qimg-a1825aa13d8b6ef80151763b881147b4-lq',
                                  name: 'Hindu Granth'.tr,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * .02,
                            ),
                             Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                reUsebaleContainer(
                                  imagePath:
                                  'https://files.prokerala.com/calendar/images/en/hindu-calendar-2024-november.png',
                                  name: 'Hindu Calender'.tr,onPressed: (){
                                  Get.to(()=>CalenderView());
                                },
                                ),

                                reUsebaleContainer(
                                  imagePath:
                                      'https://www.livemint.com/lm-img/img/2023/11/10/600x338/Diwali_2023_pooja_timings_1699604896900_1699604897141.jpg',
                                  name: 'Festival Pooja'.tr,
                                  onPressed: (){
                                    Get.to(()=>FestivalPooja());
                                  },

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
          customised_AppBar()
        ],
      )),
    );
  }
}
