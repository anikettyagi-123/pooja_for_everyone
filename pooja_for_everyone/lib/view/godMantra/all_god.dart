import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pooja_for_everyone/view/godMantra/Mantra_For_All.dart';
import 'allgod_global.dart';

class AllGod extends StatelessWidget {
  const AllGod({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        title: Center(child: Text('Mantra'.tr)),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: ALlGodGlobal(
                godName: 'Durga Mata',
                documentId: 'WqYqGBGKzy5TdbUhDE37',
                viewName: 'Durga Mata'.tr,
                imagePath: 'assets/durga mata.png',
              ),
            ),
            ALlGodGlobal(
              godName: 'Shiv Ji',
              documentId: 'AlqYebwSBWSgoUUB5QqP',
              viewName: 'Shiv Ji'.tr,
              imagePath: 'assets/shiv ji.png',
            ),
            ALlGodGlobal(
              godName: 'Ganesh Ji',
              documentId: 'w1c2cEDY41wh8nLdBAaS',
              viewName: 'Ganesh Ji'.tr,
              imagePath: 'assets/ganesh ji.png',
            ),
            ALlGodGlobal(
              godName: 'Hanuman Ji',
              documentId: 'IfoFzOS7VgW6KbohfGGt',
              viewName: 'Hanuman Ji'.tr,
              imagePath: 'assets/hanuman ji.jpg',
            ),
            ALlGodGlobal(
              godName: 'Krisna Ji',
              documentId: 'axLaTyPKiOvb1L99vYMe',
              viewName: 'Khana Ji'.tr,
              imagePath: 'assets/krishna ji.jpg',
            ),
            ALlGodGlobal(
              godName: 'Ram Ji',
              documentId: 'Ri2qJZzWDxWkfTdtoTtV',
              viewName: 'Ram ji'.tr,
              imagePath: 'assets/ram ji.jpg',
            ),
            ALlGodGlobal(
              godName: 'Radha Rani',
              documentId: 'ST9TS36WGmlvffZBDYAn',
              viewName: 'Radha Rani'.tr,
              imagePath: 'assets/radha rani.jpg',
            ),
            ALlGodGlobal(
              godName: 'Parvati Mata',
              documentId: 'Ly9yQyU4PHKiizkCuNdW',
              viewName: 'Parvati Mata'.tr,
              imagePath: 'assets/parvati mata.jpg',
            ),
            ALlGodGlobal(
              godName: 'Lakshmi Mata',
              documentId: 'aPUwj345xdTTHYaXkwmY',
              viewName: 'Lakshmi Mata'.tr,
              imagePath: 'assets/lakshmi mata.png',
            ),
            ALlGodGlobal(
              godName: 'Khatu Shyam',
              documentId: 'YcTXBcHzmvIP18XLeQPf',
              viewName: 'Khatu Shyam'.tr,
              imagePath: 'assets/baba-shyam.jpg',
            ),
            ALlGodGlobal(
              godName: 'Gau Mata',
              documentId: 'yO1lndsvoLiwy6EMw8h3',
              viewName: 'Gau Mata'.tr,
              imagePath: 'assets/gau mata.jpg',
            ),
            ALlGodGlobal(
              godName: 'Ganga Mata',
              documentId: '4zkWwp4NIxbsOLc4WSLe',
              viewName: 'Ganga Mata'.tr,
              imagePath: 'assets/ganga mata.jpg',
            ),
            ALlGodGlobal(
              godName: 'Gayatri Mata',
              documentId: 'hNOfEfSH9LESKCxd7luJ',
              viewName: 'Gayatri Mata'.tr,
              imagePath: 'assets/gayatri mata.jpg',
            ),
            ALlGodGlobal(
              godName: 'Saraswati Mata',
              documentId: 'f4lv6Qivp8TX1kG2MZqh',
              viewName: 'Saraswati Mata'.tr,
              imagePath: 'assets/saraswati mata.jpg',
            ),
            ALlGodGlobal(
              godName: 'Santoshi Mata',
              documentId: 'B9CWRLKfE3sFIUiVI72L',
              viewName: 'Santoshi Mata'.tr,
              imagePath: 'assets/santoshi mata.jpg',
            ),
            ALlGodGlobal(
              godName: 'Tulsi Mata',
              documentId: 'lMbgSHFhQ4jdsWcBhQzd',
              viewName: 'Tulsi Mata'.tr,
              imagePath: 'assets/tulsimata .jpg',
            ),
            ALlGodGlobal(
              godName: 'Sita Mata',
              documentId: 'oR8jZvBatCrXok3riNDD',
              viewName: 'Sita Mata'.tr,
              imagePath: 'assets/sita mata.jpg',
            ),
            ALlGodGlobal(
              godName: 'Vaishno Mata',
              documentId: 'X2ofbxdcyLCd1CKZfjuN',
              viewName: 'Vaishno Mata'.tr,
              imagePath: 'assets/vaishno mata.jpg',
            ),
            ALlGodGlobal(
              godName: 'Shani Dev',
              documentId: 'T4hZ26Vc48kP9iordM4I',
              viewName: 'Shani Dev'.tr,
              imagePath: 'assets/shani dev.jpg',
            ),
            ALlGodGlobal(
              godName: 'Vishnu Ji',
              documentId: 'drmJkqHTXiVugPeMtq4E',
              viewName: 'Vishnu Ji'.tr,
              imagePath: 'assets/vishnu ji.jpg',
            ),
            ALlGodGlobal(
              godName: 'Sai baba',
              documentId: 'Ogp27JsdZG6HynM6dp5o',
              viewName: 'Sai baba'.tr,
              imagePath: 'assets/sai baba.jpg',
            ),

          ],
        ),
      ),
    );
  }
}
