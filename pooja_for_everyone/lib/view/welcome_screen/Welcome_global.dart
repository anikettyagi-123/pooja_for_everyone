

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class reUsebaleContainer extends StatelessWidget {
  final String imagePath;
  final String name;
  final Color color;
    final VoidCallback? onPressed;

  const reUsebaleContainer({super.key, required this.imagePath, required this.name,this.color=Colors.black,this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: onPressed,
              child: Container(
                height:MediaQuery.of(context).size.height*.21 ,
                width: MediaQuery.of(context).size.width*.41,
                decoration: BoxDecoration(
                  color: Colors.blueGrey.withOpacity(.2),
                    borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blueGrey.withOpacity(0.2),
                      spreadRadius: 4,
                      blurRadius: 4,
                      offset: Offset(0, 3),
                    ),
                  ],



                ),
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10)),


                      child:CachedNetworkImage(
                        imageUrl: imagePath,
                        height:MediaQuery.of(context).size.height*.185 ,
                          width: double.infinity,

                          fit: BoxFit.fill,
                        placeholder: (context, url) => const Center(child: CircularProgressIndicator()),

                      )





                    ),
                    Padding(
                      padding: EdgeInsets.only(top:MediaQuery.of(context).size.height*.183 ),
                      child: Center(child: Text(name,style: TextStyle(color: color,fontSize: 17),softWrap: true,)),
                    )
                  ],
                ),
              ),
            ),



          ],
        )
      ],
    );
  }
}
