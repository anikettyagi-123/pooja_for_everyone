



import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:pooja_for_everyone/firebase/Festival.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../../firebase/fetching_mantra.dart';

class PoojaVidhi extends StatelessWidget {
  final String godName;

  final String fieldName;

  const PoojaVidhi({super.key,required this.fieldName,required this.godName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Center(child: Text(godName.tr,style: TextStyle(fontSize: 20),)),
        backgroundColor: Colors.orangeAccent,
        automaticallyImplyLeading: false,

      ),
      body: SingleChildScrollView(
        child: Column(

          children: [

            FutureBuilder(future: getFestivalText(fieldName),
                builder:(context,  snapshot){
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Padding(
                      padding: const EdgeInsets.only(top: 200),
                      child: Center(child: CircularProgressIndicator()),
                    );
                  } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {


                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(


                            height:
                            MediaQuery.of(context).size.height*.85,
                            width: double.infinity,
                            child: SfPdfViewer.network(
                              scrollDirection: PdfScrollDirection.vertical,



                              snapshot.data!,


                            ),
                          ),
                        ),
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text('Error: ${snapshot.error}'),
                    );
                  } else {
                    return Center(child: Text('Loading..'));
                  }
                }
            )],
        ),
      )

    );
  }
}
