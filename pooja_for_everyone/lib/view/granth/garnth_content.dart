


import 'package:flutter/material.dart';

import 'granth_global.dart';

class GranthContent extends StatelessWidget {
  const GranthContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Hindu Granth',style: TextStyle(fontSize: 25),)),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.orangeAccent,

      ),
      body:const Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GranthContainer(documentId: 'BMSwjJlnj3ilvTkp7dDa',
            collectionName: 'geeta',
            imagePath: 'https://i0.wp.com/hyderabadonlineshop.com/wp-content/uploads/2023/01/bhagavad-Gita-pics-1.jpg?fit=525%2C525&ssl=1',
            granthName: 'Bhagavad Gita',)

        ],

      )
      ,
    );}
}
