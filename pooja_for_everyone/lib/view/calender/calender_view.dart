

import 'package:flutter/material.dart';

import 'calender_global.dart';

class CalenderView extends StatelessWidget {

  const CalenderView({super.key});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
        child:Scaffold(
          body: Container(
            color: Colors.grey.shade300,
            height: double.infinity,
            width: double.infinity,
            child: Column(
              children: [

                SizedBox(
                  height: MediaQuery.of(context).size.height*.1,
                ),
                Text('HINDU CALENDER ',style: TextStyle(fontSize: 30,color: Colors.purple.shade300),),
                Text('2024',style: TextStyle(fontSize: 30,color: Colors.purple.shade300),),
                SizedBox(
                  height: MediaQuery.of(context).size.height*.050,
                ),
               const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                  children: [
                    CalenderGlobal( month: 'January', fieldName: 'jan',),
                    CalenderGlobal( month: 'Febuary', fieldName: 'feb',)
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height*.02,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                  children: [
                    CalenderGlobal( month: 'March', fieldName: 'march',),
                    CalenderGlobal( month: 'April', fieldName: 'april',)
                  ],
                ), SizedBox(
                  height: MediaQuery.of(context).size.height*.02,
                ),
               const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                  children: [
                    CalenderGlobal( month: 'May', fieldName: 'may',),
                    CalenderGlobal( month: 'June', fieldName: 'june',)
                  ],
                ), SizedBox(
                  height: MediaQuery.of(context).size.height*.02,
                ),
               const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CalenderGlobal( month: 'July', fieldName: 'july',),
                    CalenderGlobal( month: 'August', fieldName: 'aug',)
                  ],
                ), SizedBox(
                  height: MediaQuery.of(context).size.height*.02,
                ),
               const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                  children: [
                    CalenderGlobal( month: 'September', fieldName: 'sep',),
                    CalenderGlobal( month: 'October', fieldName: 'oct',)
                  ],
                ), SizedBox(
                  height: MediaQuery.of(context).size.height*.02,
                ),
               const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                  children: [
                    CalenderGlobal( month: 'November', fieldName: 'nov',),
                    CalenderGlobal( month: 'December', fieldName: 'dec',)
                  ],
                ),
              ],
            ),
          ),
        )
    );
  }
}
