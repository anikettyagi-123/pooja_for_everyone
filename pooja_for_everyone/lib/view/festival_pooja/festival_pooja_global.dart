



import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pooja_for_everyone/view/festival_pooja/pooja_view.dart';
import 'package:pooja_for_everyone/view/godMantra/Mantra_For_All.dart';

class FestivalGlobal extends StatelessWidget {
   final String godName;
  // final String documentId;
   final String fieldName;


  const FestivalGlobal({super.key,required this.godName,required this.fieldName});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Get.to(()=>PoojaVidhi(fieldName: fieldName, godName: godName, ));
      },
      child: Container(
        color: Colors.orangeAccent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Padding(
                  padding:  EdgeInsets.only(left:MediaQuery.of(context).size.height*.01,top:MediaQuery.of(context).size.height*.01 ),
                  child: Container(



                    height:MediaQuery.of(context).size.height*.04,
                    width: MediaQuery.of(context).size.height*.04,
                  //  color: Colors.amberAccent.shade700,
                    child: Image.asset('assets/diya.png',fit: BoxFit.cover,),
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.only(left:MediaQuery.of(context).size.height*.001,top:MediaQuery.of(context).size.height*.02 ),
                  child: Text(godName.tr,style: TextStyle(fontSize: 20),),
                ),
              ],
            ),
            Divider()
          ],
        ),
      ),
    );
  }
}
