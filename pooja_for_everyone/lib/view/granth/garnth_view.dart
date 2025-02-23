


import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'books chapter/bhagvad geeta/chapter_view.dart';
import 'books chapter/ramayan/ramayan_chapter.dart';
import 'granth_global.dart';

class GranthView extends StatelessWidget {
  final String?collectionName ;
  final String?documentId;
  final String?imagePath;
  final String?granthName;
  const GranthView({super.key,this.documentId, this.collectionName, this.imagePath,this.granthName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Hindu Granth',style: TextStyle(fontSize: 25),)),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.orangeAccent,

      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFFFFDEE9), // Pastel Pink
                Color(0xFFB5C0D0), // Soft Lavender
                Color(0xFFF5F7DC), // Moon Glow
                Color(0xFFD7E7A9), // Mint Breeze
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                GranthContainer(
                  imagePath: 'https://i0.wp.com/hyderabadonlineshop.com/wp-content/uploads/2023/01/bhagavad-Gita-pics-1.jpg?fit=525%2C525&ssl=1',
                  granthName: 'Bhagavad Gita',
                  onPressed: () {
                  Get.to(()=>ChapterView(collectionName: 'geeta', documentId: 'BMSwjJlnj3ilvTkp7dDa',)); },),
                GranthContainer(
                    imagePath: 'https://drive.google.com/uc?export=download&id=1OnZGMqg3zjRpOa8pVzLh9W1er4CHz9EO',
                    granthName: 'Ramayan', onPressed: (){
                  Get.to(()=>RamayanChapter(collectionName: 'ramayan', documentId: 'SinX12OBBR7rQw2TZSqH',)); },)
              ],
            )
            ,



          ],

        ),
      )
      ,
    );}
}
