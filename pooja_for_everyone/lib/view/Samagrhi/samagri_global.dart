

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pooja_for_everyone/view/Samagrhi/poshak.dart';

class SamagrhiGlobal extends StatelessWidget {
  final String name;
  final String imagepath;
  final VoidCallback? onPressed;
  const SamagrhiGlobal({super.key,required this.imagepath, required this.name,required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: onPressed,
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * .22,
            width: MediaQuery.of(context).size.width * .45,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(6),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.4),
                  spreadRadius: 5,
                  blurRadius: 5,//this app is my dream project want to complete it i have left every thing in between but want to finish this help me mahadev
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: CachedNetworkImage(
                imageUrl: imagepath
                ,
                height:MediaQuery.of(context).size.height*.22 ,
                width: double.infinity,

                fit: BoxFit.fill,
                placeholder: (context,url)=> const  Center(child: CircularProgressIndicator()),
              ),
            ),


          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(child: Text( name,style: TextStyle(fontSize: 18),textAlign: TextAlign.center,

            )),
          ),
        ],
      ),
    );
  }
}
