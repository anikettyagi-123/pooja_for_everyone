

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';


class TranslatorButton extends StatelessWidget {
  //final VoidCallback onpressed;
  const TranslatorButton({super.key});

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: (){
        Get.dialog(

              AlertDialog(

              title:const Column(
                children: [
                  Text('Choose Language',style: TextStyle(fontSize: 25,color: Colors.red),),
                  Text('(भाषा चुनें)',style: TextStyle(fontSize: 25,color: Colors.red),),
                ],
              ),

              content: SizedBox(
                height: MediaQuery.of(context).size.height*.15,
                child: Column(

                  children: [
                    InkWell(
                      onTap: (){
                        var locale = Locale('en','Us');
                        Get.updateLocale(locale);
                        GetStorage().write('locale', 'en_US');
                        Get.back();
                      },
                        child: Text('English',textAlign: TextAlign.center,style: TextStyle(fontSize: 18),)),
                    Divider(),
                    InkWell(
                      onTap: (){
                        var locale = Locale('hi','IN');
                        Get.updateLocale(locale);
                        GetStorage().write('locale', 'hi_IN');
                        Get.back();
                      },
                        child: Text('हिंदी',textAlign: TextAlign.center,style: TextStyle(fontSize: 18))),
                  ],
                ),
              ),

            ),



        );
      },
      child: const Icon(
        Icons.g_translate_sharp,
        color: Colors.grey,
        size: 30,
      ),
    );
  }
}
