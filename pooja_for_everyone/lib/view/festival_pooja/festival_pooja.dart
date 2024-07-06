import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'festival_pooja_global.dart';

class FestivalPooja extends StatelessWidget {
  const FestivalPooja({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orangeAccent,
          title: Center(child: Text('Festival Pooja'.tr)),
          automaticallyImplyLeading: false,
        ),
        body: const SingleChildScrollView(
          child: Column(children: [
            FestivalGlobal(
              godName: 'Basant panchami (Wed, 14 Feb, 2024)',
              fieldName: 'basant Panchami',
            ),
            FestivalGlobal(
              godName: 'Shivratri (Fri, 8 Mar, 2024)',
              fieldName: 'shivratri',
            ),
            FestivalGlobal(
              godName: 'Hanuman jayanti (Tue, 23 Apr, 2024)',
              fieldName: 'hanuman jayanti',
            ),
            FestivalGlobal(
              godName: 'Nag panchami (Fri, 9 Aug, 2024)',
              fieldName: 'nag panchami ',
            ),
            FestivalGlobal(
              godName: 'Rakhsha bandhan (Mon, 19 Aug, 2024)',
              fieldName: 'rakhsha bandhan',
            ),
            FestivalGlobal(
              godName: 'Ganesh chaturthi (Sat, 7 Sept, 2024)',
              fieldName: 'ganesh chaturthi',
            ),
            FestivalGlobal(
              godName: 'Dussehra (Sat, 12 Oct, 2024)',
              fieldName: 'Dussera',
            ),
            FestivalGlobal(
              godName: 'Karva chauth (Sun, 20 Oct, 2024)',
              fieldName: 'Karva chauth',
            ),
            FestivalGlobal(
              godName: 'Ahoi Ashtami (Thu, 24 Oct, 2024)',
              fieldName: 'Ahoi Ashtami',
            ),
            FestivalGlobal(
              godName: 'Dhanteras (Tue, 29 Oct, 2024)',
              fieldName: 'dhanteras',
            ),
            FestivalGlobal(
              godName: 'diwali ( Fri, 1 Nov, 2024)',
              fieldName: 'Diwali',
            ),
            FestivalGlobal(
              godName: 'Govardhan (Sat, 2 Nov, 2024)',
              fieldName: 'govardhan ',
            ),
            FestivalGlobal(
              godName: 'Bhai dooj (Sun, 3 Nov, 2024)',
              fieldName: 'bhai dooj',
            ),
          ]),
        ));
  }
}
