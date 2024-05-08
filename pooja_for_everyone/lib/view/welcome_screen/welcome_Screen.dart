import 'dart:ui';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pooja_for_everyone/view/godMantra/Mantra_For_All.dart';
import 'package:pooja_for_everyone/view/welcome_screen/Welcome_global.dart';

import '../../firebase/redirect_user.dart';
import '../../firebase/welcome_firebase.dart';
import '../../global/costumised aap bar/appbar.dart';
import '../Login_otp/Login_screen.dart';
import '../Login_otp/check_user_login.dart';
import '../godMantra/all_god.dart';

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
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(10)),
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
                                  name: 'Pandit ji',
                                  onPressed:  () =>isLogin('Pandit'),


                                ),
                                reUsebaleContainer(
                                  imagePath:
                                      'https://inventory.rudra-centre.org/static/images/blogs/havan+kund.jpg',
                                  name: 'Pooja',
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
                                  name: 'Mantra',
                                  onPressed: (){
                                    Get.to(()=> AllGod());

                                  },
                                ),
                                reUsebaleContainer(
                                  imagePath:
                                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRwU_aVpjfqT1FxHZjpyq2ManFJ7477fKtG9Q&usqp=CAU',
                                  name: 'Samagrhi',
                                  onPressed:  () =>
                                      isLogin('Samagrhi'),

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
                                reUsebaleContainer(
                                  imagePath:
                                      'https://files.prokerala.com/calendar/images/en/hindu-calendar-2024-november.png',
                                  name: 'Hindu Calender & Varat',
                                ),
                                reUsebaleContainer(
                                  imagePath:
                                      'https://qph.cf2.quoracdn.net/main-qimg-a1825aa13d8b6ef80151763b881147b4-lq',
                                  name: 'Hindu Granth',
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
                                reUsebaleContainer(
                                  imagePath:
                                      'https://www.prabhatkhabar.com/wp-content/uploads/2024/02/3-ayodhya-ram-mandir.jpg',
                                  name: 'Tradtional Places',
                                ),
                                reUsebaleContainer(
                                  imagePath:
                                      'https://substackcdn.com/image/fetch/w_1456,c_limit,f_webp,q_auto:good,fl_progressive:steep/https%3A%2F%2Fbucketeer-e05bbc84-baa3-437e-9518-adb32be77984.s3.amazonaws.com%2Fpublic%2Fimages%2Fc0e2e782-44d9-4171-83bc-c5bb8cf36505_940x788.png',
                                  name: 'Mantra',

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
