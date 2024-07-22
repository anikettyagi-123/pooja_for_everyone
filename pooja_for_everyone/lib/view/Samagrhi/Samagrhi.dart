

import 'package:flutter/material.dart';

class samagrhi extends StatelessWidget {
  const samagrhi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
      ),
      body:   Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
    children: [
    Center(child: Text('Currently We did not Deliver at this Pincode'))
    ],
    ),
    );
  }
}

