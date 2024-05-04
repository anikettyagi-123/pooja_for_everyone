

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pooja_for_everyone/global/costumised%20aap%20bar/three_dot/three_Dot.dart';

class customised_AppBar extends StatelessWidget {
  customised_AppBar ({super.key});

  @override
  Widget build(BuildContext context) {
    return
        Center(
        child: Padding(
          padding:  EdgeInsets.only(top:MediaQuery.of(context).size.height*.85),
          child:
          ClipRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
              child:
              Container(
                height: MediaQuery.of(context).size.height*.06,
                width: MediaQuery.of(context).size.width*.9,
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(.01),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black,width: 1.5)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                    InkWell(
                      onTap:(){
                        Get.to(()=>  Three_Dot());

                            },

                        child: Icon(Icons.more_vert_outlined,size: 30,)),
                    Icon(Icons.notifications,size: 30,),
                    Icon(Icons.shopping_cart,size: 30,),
                    Icon((Icons.headset_mic))
                  ],
                ),
              ),
            ),
          ),
        ),
      );


  }
}
