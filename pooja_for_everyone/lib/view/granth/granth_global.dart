

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'chapter_view.dart';

class GranthContainer extends StatelessWidget {
 final String collectionName ;
 final String documentId;
 final String imagePath;
 final String granthName;

  const GranthContainer({super.key,required this.documentId,required this.collectionName,required this.imagePath,required this.granthName});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: (){
            Get.to(()=>ChapterView(collectionName: collectionName, documentId: documentId,));


          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                height: MediaQuery.of(context).size.height * .26,
                width: MediaQuery.of(context).size.width * .48,
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
                          height:MediaQuery.of(context).size.height*.22 ,
                          width: double.infinity,

                          fit: BoxFit.fill,
                          placeholder: (context, url) => const Center(child: CircularProgressIndicator()),

                        )





                    ),
                    Text(granthName,style: TextStyle(fontSize: 20),)

                  ],
                ),
            ),
          ),
        ),

      ],
    );
  }
}
