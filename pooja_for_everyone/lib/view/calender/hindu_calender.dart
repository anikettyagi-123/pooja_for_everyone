import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';

import '../../firebase/fetching_calender.dart';


class HinduCalneder extends StatelessWidget {
  final String month;
  final String fieldName;

  const HinduCalneder(
      {super.key, required this.month, required this.fieldName});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.black,
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * .2,
            ),
            Text("Zoom to Read",style: TextStyle(fontSize: 25,color: Colors.white),),
            SizedBox(
              height: MediaQuery.of(context).size.height * .02,
            ),
            FutureBuilder(
                future: fetchCalender(),
                builder: (BuildContext context,
                    AsyncSnapshot<Map<String, dynamic>?> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const  Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                    Map<String, dynamic>? calender = snapshot.data;

                    return  Container(
                        height: MediaQuery.of(context).size.height * .45,
                        width: double.infinity,
                        child: InteractiveViewer(
                          maxScale: 2.6,
                          child: ClipRRect(
                            child: CachedNetworkImage(
                              imageUrl: calender![fieldName],
                              height: MediaQuery.of(context).size.height * .4,
                              width: double.infinity,
                              fit: BoxFit.fill,
                              placeholder: (context, url) => const Center(
                                  child: CircularProgressIndicator()),
                            ),
                          ),
                        ));
                  }
                  return const Center(child: CircularProgressIndicator());
                })


          ],
        ),
      ),
    ));
  }
}
