

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pooja_for_everyone/view/godMantra/Mantra_For_All.dart';

class ALlGodGlobal extends StatelessWidget {
  final String godName;
  final String documentId;
 // final String fieldName;


  const ALlGodGlobal({super.key,required this.godName,required this.documentId,});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:  EdgeInsets.only(left:MediaQuery.of(context).size.height*.01,top:MediaQuery.of(context).size.height*.02 ),
          child: InkWell(
            onTap: (){
              Get.to(()=>Mantra(godName: godName, documentId: documentId, ));
            },
              child: Text(godName,style: TextStyle(fontSize: 20),)),
        ),
        Divider()
      ],
    );
  }
}
