

import 'dart:core';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../Granth_content.dart';

class RamayanChapterGlobal extends StatelessWidget {
  final String fieldName;
  final String chapterName;
  final String imagePath;
  final String collectionName ;
  final String documentId;

  const RamayanChapterGlobal({super.key,required this.fieldName,required this.chapterName,required this.imagePath,required this.collectionName,required this.documentId });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:(){
        Get.to(()=>Granthdata(collectionName: collectionName, documentId: documentId, fieldName: fieldName,));
      },



      child: Padding(
        padding: const EdgeInsets.only(top: 12.0,left: 5,right: 5),
        child: Container(
          height: MediaQuery.of(context).size.height * .273,
          width: MediaQuery.of(context).size.width * .47,
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            //  borderRadius: BorderRadius.(5,),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.4),
                spreadRadius: 5,
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child:  Column(
            children: [
              ClipRRect(
                //  borderRadius: BorderRadius.circular(10),


                  child:CachedNetworkImage(
                    imageUrl: imagePath,
                    height:MediaQuery.of(context).size.height*.20 ,
                    width: double.infinity,

                    fit: BoxFit.fill,
                    placeholder: (context, url) => const Center(child: CircularProgressIndicator()),

                  )





              ),
              Text(chapterName,style: TextStyle(fontSize: 20,),textAlign: TextAlign.center,)

            ],
          ),
        ),
      ),
     );
  }
}
