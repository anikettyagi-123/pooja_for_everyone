

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'granth_data.dart';

class ViewWidget extends StatelessWidget {
  final String collectionName ;
  final String documentId;
  final String chapterNo;
  const ViewWidget({super.key,required this.documentId,required this.collectionName,required this.chapterNo});

  @override
  Widget build(BuildContext context) {
    return      Padding(
      padding:  EdgeInsets.only(left:MediaQuery.of(context).size.height*.01,top:MediaQuery.of(context).size.height*.02),
      child: ElevatedButton(
        onPressed:  (){
          Get.to(()=>Granthdata(collectionName: collectionName, documentId: documentId, fieldName: chapterNo,));},
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.grey.shade300, // Set background color to grey
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0), // Set border radius
              side: BorderSide(color: Colors.grey), // Set border color
            ),
          ),


         child: Container(
             height: MediaQuery.of(context).size.height*.03,
             width:  MediaQuery.of(context).size.width*.25,
             child: Text(chapterNo,style: TextStyle(fontSize: 19,color:Colors.black,fontStyle: FontStyle.normal)))

      ),
    );
  }
}
