

import 'package:flutter/material.dart';

class areaPandit extends StatelessWidget {
  const areaPandit({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(child: Text('Currently no Pandit Ji Availabele '))
        ],
      ),
    );
  }
}
