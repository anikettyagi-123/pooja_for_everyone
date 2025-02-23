

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pooja_for_everyone/view/godMantra/Mantra_For_All.dart';

class ALlGodGlobal extends StatelessWidget {
  final String godName;
  final String documentId;
  final String viewName;
  final String imagePath;


  const ALlGodGlobal({super.key,required this.godName,required this.documentId,required this.viewName,required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Get.to(()=>Mantra(godName: godName, documentId: documentId, viewName: viewName, ));
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                      width: 1
                    )
                  ),

                  height:MediaQuery.of(context).size.height*.06 ,
                  width:MediaQuery.of(context).size.width*.13  ,
                  child: Image.asset(imagePath,fit: BoxFit.fill,),
                ),
              ),
             // Image.asset('assets/durga,png',height: 50,width: 5,),
              Padding(
                padding:  EdgeInsets.only(left:MediaQuery.of(context).size.height*.01,top:MediaQuery.of(context).size.height*.02 ),
                child: Text(viewName,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
              ),
            ],
          ),
          Divider()
        ],
      ),
    );
  }
}
