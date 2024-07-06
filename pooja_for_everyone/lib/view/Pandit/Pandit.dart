

import 'package:flutter/material.dart';

class areaPandit extends StatelessWidget {
  const areaPandit({super.key});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Center(child: Text('Pandit'))
          ],
        ),
      ),
    );
  }
}
