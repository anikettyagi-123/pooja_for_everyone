import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'dart:typed_data';

class ReusableContainer extends StatelessWidget {
  final String imagePath;
  final String name;
  final Color color;
  final String blur;
  final VoidCallback? onPressed;

  const ReusableContainer({
    super.key,
    required this.imagePath,
    required this.name,
    this.color = Colors.black,
    this.onPressed,
    required this.blur,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min, // Ensures it wraps the content properly
      children: [
        InkWell(
          onTap: onPressed,
          child: Column(
            children: [
              // Image Container
              Container(
                height: MediaQuery.of(context).size.height * .192,
                width: MediaQuery.of(context).size.width * .41,
                decoration: BoxDecoration(
                  color: Colors.blueGrey.withAlpha(51),
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blueGrey.withAlpha(51),
                      spreadRadius: 4,
                      blurRadius: 4,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Stack(
                    children: [
                      // BlurHash as Background
                      Positioned.fill(
                        child: BlurHash(
                          hash: blur,
                          imageFit: BoxFit.fill,
                        ),
                      ),

                      // Cached Network Image with FadeIn Transition
                      Positioned.fill(
                        child: CachedNetworkImage(
                          imageUrl: imagePath,
                          fit: BoxFit.fill,
                          placeholder: (context, url) => SizedBox(),
                          errorWidget: (context, url, error) => Icon(Icons.error),
                          imageBuilder: (context, imageProvider) {
                            return FadeInImage(
                              placeholder: MemoryImage(Uint8List(0)),
                              image: imageProvider,
                              fit: BoxFit.fill,
                              fadeInDuration: Duration(milliseconds: 800),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Text Below Image
              Padding(
                padding: const EdgeInsets.only(top: 6.0), // Space between image and text
                child: Text(
                  name,
                  style: TextStyle(color: color, fontSize: 17),
                  softWrap: true,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

