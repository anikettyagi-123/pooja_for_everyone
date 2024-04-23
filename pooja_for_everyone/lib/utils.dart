

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class Reusebale_Container extends StatelessWidget {
  final String imagePath;
  final String Name;
  final Color;

  const Reusebale_Container({super.key, required this.imagePath, required this.Name,this.Color=Colors.white});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height:MediaQuery.of(context).size.height*.2 ,
              width: MediaQuery.of(context).size.width*.45,
              decoration: BoxDecoration(
                color: Colors.grey,
                  borderRadius: BorderRadius.circular(10),



              ),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),


                    child:CachedNetworkImage(
                      imageUrl: imagePath,
                      height:MediaQuery.of(context).size.height*.2 ,
                        width: double.infinity,

                        fit: BoxFit.fill,
                      placeholder: (context, url) => const Center(child: CircularProgressIndicator()),

                    )

                    //Image.network(imagePath,fit: BoxFit.cover,height:MediaQuery.of(context).size.height*.2 ,),
                    


                  ),
                  Padding(
                    padding: EdgeInsets.only(top:MediaQuery.of(context).size.height*.17 ),
                    child: Center(child: Text(Name,style: TextStyle(color: Color),)),
                  )
                ],
              ),
            ),



          ],
        )
      ],
    );
  }
}
