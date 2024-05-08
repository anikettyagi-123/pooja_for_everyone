

import 'package:flutter/material.dart';

import '../../firebase/fetching_mantra.dart';

class Mantra extends StatelessWidget {
  const Mantra({super.key});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FutureBuilder(
                future: getMantraText(),
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
        )
      ),
    );
  }
}
