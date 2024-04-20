

import 'package:flutter/material.dart';

class buttomAppbar extends StatelessWidget {
  const buttomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(

        elevation: 0,
        child: Container(
          height: MediaQuery.of(context).size.height*02,
          decoration: BoxDecoration(
            color: Colors.transparent
          ),
        ),
      ),
    );
  }
}
