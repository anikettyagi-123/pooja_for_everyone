

import 'package:flutter/material.dart';

import '../../firebase/fetching_mantra.dart';

class Mantra extends StatelessWidget {
  final String godName;
  final String documentId;


  const Mantra({super.key,required this.godName,required this.documentId,});

  @override
  Widget build(BuildContext context) {
    return  DefaultTabController(
      length: 3,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
           // title: Center(child: Text('Mantra')),
              automaticallyImplyLeading: false,
            bottom: TabBar(
              tabs: [
                Tab(text:'Chalisa'),
                Tab(text: 'Arti',),
                Tab(text: 'Katha',)
              ],
            )
          ),
          body: TabBarView(
            children: [
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FutureBuilder(
                      future: getMantraText(godName,documentId,'chalisa'),
                      builder:
                          (context,  snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Padding(
                            padding: const EdgeInsets.only(top: 200),
                            child: Center(child: CircularProgressIndicator()),
                          );
                        } else if (snapshot.hasData &&
                            snapshot.data!.isNotEmpty) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(child: Text(snapshot.data!,textAlign: TextAlign.center,style: TextStyle(fontSize: 20),)),

                          );
                        } else {
                          return Center(child: Text('Loading..'));
                        }
                      },
                    )

                  ],
                ),
              ),
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FutureBuilder(
                      future: getMantraText(godName,documentId,'arti'),
                      builder:
                          (context,  snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Padding(
                            padding: const EdgeInsets.only(top: 200),
                            child: Center(child: CircularProgressIndicator()),
                          );
                        } else if (snapshot.hasData &&
                            snapshot.data!.isNotEmpty) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(child: Text(snapshot.data!,textAlign: TextAlign.center,style: TextStyle(fontSize: 20),)),

                          );
                        } else {
                          return Center(child: Text('Loading..'));
                        }
                      },
                    )

                  ],
                ),
              ),
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FutureBuilder(
                      future: getMantraText(godName,documentId,'katha'),
                      builder:
                          (context,  snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Padding(
                            padding: const EdgeInsets.only(top: 200),
                            child: Center(child: CircularProgressIndicator()),
                          );
                        } else if (snapshot.hasData &&
                            snapshot.data!.isNotEmpty) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(child: Text(snapshot.data!,textAlign: TextAlign.center,style: TextStyle(fontSize: 20),)),

                          );
                        } else {
                          return Center(child: Text('Loading..'));
                        }
                      },
                    )

                  ],
                ),
              ),

            ],
          )
        ),
      ),
    );
  }
}
