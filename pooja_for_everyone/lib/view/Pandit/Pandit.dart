import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pooja_for_everyone/global/appbar.dart';

class areaPandit extends StatelessWidget {
  const areaPandit({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppbar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height:MediaQuery.of(context).size.height*.01 ,
            ),
            Container(
              width:MediaQuery.of(context).size.width*.95,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade300,
                    blurRadius: 6,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Image section
                  ClipRRect(
                    borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(12)),
                    child: CachedNetworkImage(
                      fit: BoxFit.fill,
                     imageUrl:  'https://www.namastegod.com/static/72ac80b20549f9e04c1098352d7d4b1e/a8e8b/Pandit%20Ashutosh%20Pandey.jpg',


                      width: double.infinity,
                      height:MediaQuery.of(context).size.height*.3 ,
                      placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                      errorWidget: (context, url, error) => Icon(Icons.error),




                    ),
                  ),
                  // Details section
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Name: Ramnath ',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Average Price:  Rs500',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey.shade700,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Experience: 10 years',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey.shade700,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Place: Shiv Mandir Govindpuram',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey.shade700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Lottie animation and message
            // Center(
            //   child: Lottie.asset(
            //     'assets/animations/error.json',
            //     width: MediaQuery.of(context).size.width * 0.5,
            //   ),
            // ),
            // const SizedBox(height: 10),
            // const Center(
            //   child: Text(
            //     'Currently no Pandit Ji Available',
            //     style: TextStyle(fontSize: 17),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
