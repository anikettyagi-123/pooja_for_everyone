



import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'hindu_calender.dart';

class CalenderGlobal extends StatelessWidget {
  final String month;
  final String fieldName;
  const CalenderGlobal({super.key,required this.month,required this.fieldName});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left:MediaQuery.of(context).size.height*.01,top:MediaQuery.of(context).size.height*.02 ),
      child: ElevatedButton(
          onPressed: () {
        Get.to(()=>HinduCalneder(month: month, fieldName: fieldName,));
      },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.grey.shade300, // Set background color to grey
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0), // Set border radius
              side: BorderSide(color: Colors.grey), // Set border color
            ),
          ),
      child: Text(month,style: TextStyle(fontSize: 20),)),
    );
  }
}
