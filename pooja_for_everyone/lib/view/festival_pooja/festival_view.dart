import 'package:flutter/material.dart';


import 'festival_pooja_global.dart';

class FestivalPooja extends StatelessWidget {
  const FestivalPooja({super.key});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        backgroundColor: Colors.orangeAccent,
          // appBar: AppBar(
          //   backgroundColor: Colors.orangeAccent,
          //   title: Center(child: Text('Festival Pooja'.tr)),
          //   automaticallyImplyLeading: false,
          // ),
          body:  SingleChildScrollView(
            child: Column(children: [
              SizedBox(
                height: MediaQuery.of(context).size.height*.04,
              ),
              Row(
                children: [
                  IconButton(onPressed: (){}, icon:const Icon(Icons.arrow_back_ios_new_outlined)),
                  ElevatedButton(
                      onPressed: (){},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange.shade700
                      ),
                      child:  SizedBox(
                          height: MediaQuery.of(context).size.height*.03,
                          width:  MediaQuery.of(context).size.width*.60,
                          child:const Center(child: Text(' YEAR 2024',style: TextStyle(fontSize: 19,color:Colors.black,fontStyle: FontStyle.normal))))),
                  IconButton(onPressed: (){}, icon:const Icon(Icons.arrow_forward_ios_outlined)),
                ],
              ),
              const FestivalGlobal(
                godName: 'Basant panchami (Wed 14 Feb 2024)',
                fieldName: 'basant Panchami',
              ),
              const FestivalGlobal(
                godName: 'Shivratri (Fri, 8 Mar, 2024)',
                fieldName: 'shivratri',
              ),
              const FestivalGlobal(
                godName: 'Hanuman jayanti (Tue, 23 Apr, 2024)',
                fieldName: 'hanuman jayanti',
              ),
             const FestivalGlobal(
                godName: 'Nag panchami (Fri, 9 Aug, 2024)',
                fieldName: 'nag panchami ',
              ),
             const FestivalGlobal(
                godName: 'Rakhsha bandhan (Mon, 19 Aug, 2024)',
                fieldName: 'rakhsha bandhan',
              ),
             const FestivalGlobal(
                godName: 'Ganesh chaturthi (Sat, 7 Sept, 2024)',
                fieldName: 'ganesh chaturthi',
              ),
             const FestivalGlobal(
                godName: 'Dussehra (Sat, 12 Oct, 2024)',
                fieldName: 'Dussera',
              ),
             const FestivalGlobal(
                godName: 'Karva chauth (Sun, 20 Oct, 2024)',
                fieldName: 'Karva chauth',
              ),
             const FestivalGlobal(
                godName: 'Ahoi Ashtami (Thu, 24 Oct, 2024)',
                fieldName: 'Ahoi Ashtami',
              ),
             const FestivalGlobal(
                godName: 'Dhanteras (Tue, 29 Oct, 2024)',
                fieldName: 'dhanteras',
              ),
             const FestivalGlobal(
                godName: 'diwali ( Fri, 1 Nov, 2024)',
                fieldName: 'Diwali',
              ),
             const FestivalGlobal(
                godName: 'Govardhan (Sat, 2 Nov, 2024)',
                fieldName: 'govardhan ',
              ),
             const FestivalGlobal(
                godName: 'Bhai dooj (Sun, 3 Nov, 2024)',
                fieldName: 'bhai dooj',
              ),
            ]),
          )),
    );
  }
}
