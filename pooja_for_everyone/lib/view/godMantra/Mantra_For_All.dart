

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../firebase/fetching_mantra.dart';

class Mantra extends StatelessWidget {
  final String godName;
  final String documentId;
  final String viewName;

  const Mantra({
    Key? key,
    required this.godName,
    required this.documentId,
    required this.viewName
  }) : super(key: key);

  Widget buildMantraTab(String category) {


    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FutureBuilder(
            future: getMantraText(godName, documentId, category),
            builder: (context,  snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const  Padding(
                  padding: const EdgeInsets.only(top: 200),
                  child: Center(child: CircularProgressIndicator()),
                );
              } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {


                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Text(
                      snapshot.data!,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text('Error: ${snapshot.error}'),
                );
              } else {
                return const Center(child: Text('Loading..'));
              }
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return DefaultTabController(
      length: 3,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Center(child: Text(viewName.tr,style: TextStyle(fontSize: 25,),)),
            backgroundColor: Colors.orangeAccent.shade200,

            automaticallyImplyLeading: false,
            bottom:TabBar(
              tabs: [
                Tab(text: 'Chalisa'.tr),
                Tab(text: 'Arti'.tr),
                Tab(text: 'Katha'.tr),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              buildMantraTab('chalisa'.tr),
              buildMantraTab('arti'.tr),
              buildMantraTab('katha'.tr),
            ],
          ),
        ),
      ),
    );
  }
}
