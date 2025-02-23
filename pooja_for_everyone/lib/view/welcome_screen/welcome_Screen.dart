import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:pooja_for_everyone/view/festival_pooja/festival_view.dart';
import 'package:pooja_for_everyone/view/welcome_screen/Welcome_global.dart';
import '../../controller/welcomew controller.dart';
import '../../firebase/welcome_firebase.dart';

import '../../global/costumised bottom aap bar/appbar.dart';
import '../Login_otp/check_user_login.dart';
import '../calender/calender_view.dart';
import '../godMantra/all_god.dart';
import '../granth/garnth_view.dart';
import '../language_translator/language_botton_global.dart';
import '../Nwespage/news.dart';
import '../poojaPackage/pooja_package.dart';
import '../traditional places/traditional_places.dart';
import 'dart:typed_data';

class WelcomeScreen extends StatelessWidget {
  WelcomeScreen({super.key});

  final List<String> godMantra = [
    'ॐ नमः शिवाय',
    "ॐ हं हनुमते नमः",
    "ॐ गं गणपतये नमः",
    "ॐ नमो भगवते वासुदेवाय",
    "ॐ लक्ष्मी नरायण नमो नमः",
    "ॐ शं शनैश्चराय नमः",
    "ॐ आदित्याय नमः"
  ];
  final List<String> blurImage = [
    'L6C?s5qF004.054.~A.800zVJ4r;',
    'L4HnKU5t00]g00IrZk-P00V=~qO[',
    'L6J61gD+00~A1G-B0:nj01xr_L59',
    'LNIg=dIV@?t7~UNGrrogIAS4r]WB',
    'LNKSxFWBANV_CmoctPkBn3WFrVf*',
    r"LMGPpzSw[BoM}W$%NasUNJWCEjS3",
    'LKJ%IHof02a#{HjsS8bH4;a#xtk9'
  ];

  int _getCurrentDayOfWeek() {
    DateTime now = DateTime.now();
    return now.weekday;
  }

  @override
  Widget build(BuildContext context) {
    final volumeController = Get.put(VolumeController());
    final lottieAnimationController = Get.put(LottieAnimationController());

    int currentDay = _getCurrentDayOfWeek();
    int index = currentDay - 1;

    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFFD4ECDD), // Mint Green
                Color(0xFFF9C5D1),
                Color(0xFFFFE29F), // Light Orange
                Color(0xFFFFD8A8), // Pastel Yellow
               // Rose Pink
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Stack(
            children: [
              Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .015,
                  ),
                  Stack(
                    children: [
                      // BlurHash(hash: blurImage[index],imageFit: BoxFit.fill,),
                      Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Obx(() => Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                      color: Colors.grey.shade400,
                                      borderRadius: BorderRadius.circular(50)),
                                  child: Center(
                                      child: IconButton(
                                          onPressed: () async {
                                            volumeController.toggleVolume();
                                          },
                                          icon: Icon(volumeController.volume.value
                                              ? Icons.volume_up_rounded
                                              : Icons.volume_off_rounded))))),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: MediaQuery.of(context).size.width * .01,
                                    right:
                                        MediaQuery.of(context).size.width * .1),
                                child: Center(
                                  child: Text(
                                    'आज का मंत्र'.tr,
                                    style: const TextStyle(fontSize: 18),
                                  ),
                                ),
                              ),
                              const TranslatorButton(),
                            ],
                          ),
                          Center(
                            child: AnimatedTextKit(
                              animatedTexts: [
                                TypewriterAnimatedText(godMantra[index],
                                    textStyle: const TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.orange),
                                    speed: const Duration(milliseconds: 100))
                              ],
                            ),
                          ),
                          FutureBuilder(
                            future: getImageOfGodUrls(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return Container(
                                  height:
                                      MediaQuery.of(context).size.height * .30,
                                  width: MediaQuery.of(context).size.width * .82,
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade200,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withAlpha(100),
                                        spreadRadius: 5,
                                        blurRadius: 5,
                                        offset: const Offset(0, 3),
                                      ),
                                    ],
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: BlurHash(
                                      hash: blurImage[index],
                                      imageFit: BoxFit.fill,
                                    ),
                                  ),
                                );
                              } else if (snapshot.hasData &&
                                  snapshot.data!.isNotEmpty) {
                                return Container(
                                  height:
                                      MediaQuery.of(context).size.height * .30,
                                  width: MediaQuery.of(context).size.width * .82,
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade200,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withAlpha(100),
                                        spreadRadius: 5,
                                        blurRadius: 5,
                                        offset: const Offset(0, 3),
                                      ),
                                    ],
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Stack(
                                      children: [
                                        // Keep BlurHash as a background (so it doesn't reappear)
                                        Positioned.fill(
                                          child: BlurHash(
                                            hash: blurImage[index],
                                            imageFit: BoxFit.fill,
                                          ),
                                        ),

                                        // Cached Network Image with smooth fade-in transition
                                        Positioned.fill(
                                          child: CachedNetworkImage(
                                            imageUrl: snapshot.data!,
                                            fit: BoxFit.fill,
                                            placeholder: (context, url) =>
                                                SizedBox(),
                                            // Keeps BlurHash as background
                                            errorWidget: (context, url, error) =>
                                                Icon(Icons.error),
                                            imageBuilder:
                                                (context, imageProvider) {
                                              return FadeInImage(
                                                placeholder:
                                                    MemoryImage(Uint8List(0)),
                                                // Empty placeholder prevents BlurHash from appearing again
                                                image: imageProvider,
                                                fit: BoxFit.fill,
                                                fadeInDuration:
                                                    Duration(milliseconds: 800),
                                              );
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              } else {
                                return Container(
                                  height:
                                      MediaQuery.of(context).size.height * .30,
                                  width: MediaQuery.of(context).size.width * .82,
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade200,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withAlpha(100),
                                        spreadRadius: 5,
                                        blurRadius: 5,
                                        offset: const Offset(0, 3),
                                      ),
                                    ],
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: BlurHash(
                                      hash: blurImage[index],
                                      imageFit: BoxFit.fill,
                                    ),
                                  ),
                                );
                              }
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .012,
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Card(
                            color: Colors.white70,
                            elevation: 10,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20.0),
                                topRight: Radius.circular(20.0),
                              ),
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20.0),
                                  topRight: Radius.circular(20.0),
                                ),
                                gradient: LinearGradient(
                                  colors: [
                                    // Soft Saffron
                                    Color(0xFFFFDEE9), // Pastel Pink
                                    Color(0xFFB5C0D0), // Soft Lavender
                                    Color(0xFFF5F7DC), // Moon Glow
                                    Color(0xFFD7E7A9), // Mint Breeze // Golden Hue


                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                              ),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height:
                                        MediaQuery.of(context).size.height * .03,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      ReusableContainer(
                                        imagePath:
                                            'https://content.jdmagicbox.com/comp/chandigarh/r9/0172px172.x172.201102213540.f3r9/catalogue/best-pandit-ji-chandigarh-namami-astro--chandigarh-chandigarh-astrologers-62den9a9or.jpg',
                                        name: 'Pandit ji'.tr,
                                        blur: 'LhQa{ujEt+gM*IkDkDofiybvidi_',
                                        onPressed: () {
                                          isLogin('Pandit');
                                          volumeController.player
                                              .stop(); //this i have to stop audio when moving to new screen
                                          volumeController.volume(false);
                                        },
                                      ),
                                      ReusableContainer(
                                        imagePath:
                                            'https://ashtok.com/cdn/shop/products/CopperHavanKundTraditionalPoojaIndian7_1024x1024.jpg?v=1663305758',
                                        name: 'Pooja'.tr,
                                        blur: 'LAGj?0%000xu_M^400oz059bRjE2',
                                        onPressed: () {
                                          Get.to(() => poojaPackage());
                                        },
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height:
                                        MediaQuery.of(context).size.height * .01,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      ReusableContainer(
                                        imagePath:
                                            'https://www.prabhatkhabar.com/wp-content/uploads/2024/02/3-ayodhya-ram-mandir.jpg',
                                        name: 'Tour&Travel'.tr,
                                        blur: 'LZLyWLjHk=oePqj@TKWXu4W;R6n%',
                                        onPressed: () {
                                          Get.to(() => const TraditonalPlaces());
                                          volumeController.player
                                              .stop(); //this i have to stop audio when moving to new screen
                                          volumeController.volume(false);
                                        },
                                      ),
                                      ReusableContainer(
                                          imagePath:
                                              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRwU_aVpjfqT1FxHZjpyq2ManFJ7477fKtG9Q&usqp=CAU',
                                          name: 'Samagrhi'.tr,
                                          blur: 'LDF=gWRS~U%1-2x]xGxB%eD+S1xH',
                                          onPressed: () {
                                            isLogin('Samagrhi');
                                            volumeController.player
                                                .stop(); //this i have to stop audio when moving to new screen
                                            volumeController.volume(false);
                                          }),
                                    ],
                                  ),
                                  SizedBox(
                                    height:
                                        MediaQuery.of(context).size.height * .02,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Get.to(() => const NewsPage());
                                      volumeController.player
                                          .stop(); //this i have to stop audio when moving to new screen
                                      volumeController.volume(false);
                                    },
                                    child: Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                .10,
                                        width: MediaQuery.of(context).size.width *
                                            .87,
                                        decoration: BoxDecoration(
                                          color: Colors.grey.shade200,
                                          borderRadius: BorderRadius.circular(5),
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.black.withOpacity(0.4),
                                              spreadRadius: 5,
                                              blurRadius: 5,
                                              offset: const Offset(0, 3),
                                            ),
                                          ],
                                        ),
                                        child: Image.asset(
                                          'assets/sanatan.png',
                                          fit: BoxFit.fill,
                                        )),
                                  ),
                                  SizedBox(
                                    height:
                                        MediaQuery.of(context).size.height * .02,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      ReusableContainer(
                                        color: Colors.black,
                                        imagePath:
                                            'https://st.depositphotos.com/2235295/2458/i/450/depositphotos_24589939-stock-photo-hindu-om-symbol.jpg',
                                        name: 'Mantra'.tr,
                                        blur: r'LRRCl7xv.Tfkxvt7tRM_x^V@n$WB',
                                        onPressed: () {
                                          Get.to(() => const AllGod());
                                          volumeController.player
                                              .stop(); //this i have to stop audio when moving to new screen
                                          volumeController.volume(false);
                                        },
                                      ),
                                      ReusableContainer(
                                        imagePath:
                                            'https://qph.cf2.quoracdn.net/main-qimg-a1825aa13d8b6ef80151763b881147b4-lq',
                                        name: 'Hindu Granth'.tr,
                                        blur: 'LJJsqX8w_NnhMI?cInV[0LO@s8Rl',
                                        onPressed: () {
                                          Get.to(() => const GranthView());
                                          volumeController.player
                                              .stop(); //this i have to stop audio when moving to new screen
                                          volumeController.volume(false);
                                        },
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height:
                                        MediaQuery.of(context).size.height * .01,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      ReusableContainer(
                                        imagePath:
                                            'https://files.prokerala.com/calendar/images/en/hindu-calendar-2024-november.png',
                                        name: 'Hindu Calender'.tr,
                                        blur: 'LpQug6kCrqof*0oLV@j[L}f7bbba',
                                        onPressed: () {
                                          Get.to(() => const CalenderView());
                                          volumeController.player
                                              .stop(); //this i have to stop audio when moving to new screen
                                          volumeController.volume(false);
                                        },
                                      ),
                                      ReusableContainer(
                                        imagePath:
                                            'https://www.livemint.com/lm-img/img/2023/11/10/600x338/Diwali_2023_pooja_timings_1699604896900_1699604897141.jpg',
                                        name: 'Festival Pooja'.tr,
                                        blur: 'L5Chco0#02={X+jvIoSh01oM~U9u',
                                        onPressed: () {
                                          Get.to(() => const FestivalPooja());
                                          volumeController.player
                                              .stop(); //this i have to stop audio when moving to new screen
                                          volumeController.volume(false);
                                        },
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height:
                                        MediaQuery.of(context).size.height * .2,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Obx(() {
                if (lottieAnimationController.showAnimation.value) {
                  return Center(
                    child: Lottie.asset(
                      'animation/petals.json',
                      fit: BoxFit.cover,
                    ),
                  );
                } else {
                  return const SizedBox.shrink();
                }
              }),
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Obx(() {
                  if (lottieAnimationController.showAnimation.value) {
                    return SizedBox(
                      height: MediaQuery.of(context).size.height * .1,
                      // width: MediaQuery.of(context).size.height * .7,
                      child: Lottie.asset(
                        'animation/petals.json',
                        fit: BoxFit.contain,
                      ),
                    );
                  } else {
                    return const SizedBox.shrink();
                  }
                }),
              ),
              customised_AppBar()
            ],
          ),
        ),
      ),
    );
  }
}
