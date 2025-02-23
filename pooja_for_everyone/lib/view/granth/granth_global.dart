

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';


class GranthContainer extends StatelessWidget {

 final String imagePath;
 final String granthName;
 final VoidCallback? onPressed;

  const GranthContainer({super.key,required this.imagePath,required this.granthName,required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:
       onPressed,


      child: Padding(
        padding: const EdgeInsets.only(top: 8.0,left: 5,right: 5),
        child: Column(
          children: [
            Container(
                height: MediaQuery.of(context).size.height * .22,
                width: MediaQuery.of(context).size.width * .47,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                //  borderRadius: BorderRadius.(5,),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.4),
                      spreadRadius: 5,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child:  ClipRRect(
                  //  borderRadius: BorderRadius.circular(10),


                    child:CachedNetworkImage(
                      imageUrl: imagePath,
                      height:MediaQuery.of(context).size.height*.22 ,
                      width: double.infinity,

                      fit: BoxFit.fill,
                      placeholder: (context, url) => const Center(child: CircularProgressIndicator()),

                    )





                ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(granthName,style: TextStyle(fontSize: 20),),
            )
          ],
        ),
      ),
    );
  }
}
