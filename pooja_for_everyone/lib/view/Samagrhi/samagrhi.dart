import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pooja_for_everyone/global/appbar.dart';
import 'package:pooja_for_everyone/view/Samagrhi/poshak.dart';
import 'package:pooja_for_everyone/view/Samagrhi/samagri_global.dart';

import 'complete_Pooja.dart';

class Samagrhi extends StatelessWidget {
  const Samagrhi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppbar(),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFFFE29F), // Light Orange
              Color(0xFFFFD8A8), // Pastel Yellow
              Color(0xFFD4ECDD), // Mint Green
              Color(0xFFF9C5D1), // Rose Pink// Mint Breeze // Ivory White // Pastel Yellow
              // Rose Pink
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * .02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SamagrhiGlobal(
                  imagepath:
                      'https://i.pinimg.com/736x/28/48/da/2848dafec658a70a18429b77cca94888.jpg',
                  name: 'KanhaJi \n RadhaRani Poshak',
                  onPressed: (){
                    Get.to(()=>PoshakPage());
                  },
                ),
                SamagrhiGlobal(
                  imagepath:
                      'https://m.media-amazon.com/images/I/81Ml0C-4nRL._AC_UF894,1000_QL80_.jpg',
                  name: 'Complete Pooja\n Samagrhi',

                  onPressed: (){Get.to(()=>Complete_samaghri()); },
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .02,
            ),
            Container(
              height: MediaQuery.of(context).size.height * .2,
              width: MediaQuery.of(context).size.width * .98,
              color: Colors.blueGrey,
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 25.0,top: 8),
                    child: Text(
                      'Always',
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w800,
                          color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 25.0),
                    child: Text(
                      'deliver more',
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w800,
                          color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 25.0),
                    child: Text(
                      'than expected',
                      style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SamagrhiGlobal(
                  imagepath:
                      'https://instamart-media-assets.swiggy.com/swiggy/image/upload/fl_lossy,f_auto,q_auto,h_600/b0b602296b518b90bf01820c267b054f',
                  name: 'Samagrhi For Daily \n Use ',
                  onPressed: (){
                    Get.to(()=>PoshakPage());
                  },
                ),
                SamagrhiGlobal(
                  imagepath:
                      'https://www.jiomart.com/images/product/original/rvyt2id4yb/vanishree-world-rudraksha-god-trishul-damru-shiva-mahadev-mahakal-locket-pendant-gold-plated-product-images-rvyt2id4yb-0-202310041608.png?im=Resize=(420,420)',
                  name: 'God Goddess \nPendants & Lockets',
                  onPressed: (){ Get.to(()=>PoshakPage());},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
