
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:get/get.dart';
import 'dart:io';

import '../../controller/granth_controller.dart';


class Granthdata extends StatelessWidget {
  final String collectionName;
  final String documentId;
  final String fieldName;

  const Granthdata({
    super.key,
    required this.collectionName,
    required this.documentId,
    required this.fieldName,
  });

  @override
  Widget build(BuildContext context) {
    final  pdfController = Get.put(PdfController(
      collectionName: collectionName,
      documentId: documentId,
      fieldName: fieldName,
    ));

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        automaticallyImplyLeading: false,
      ),
      body: Obx(() {
        if (pdfController.isLoading.value) {
          return Center(child: Lottie.asset('animation/wait.json',
              height: MediaQuery.of(context).size.height*15,
              width: MediaQuery.of(context).size.width*30
          ));
        } else if (pdfController.pdfPath.isNotEmpty) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * .85,
                  width: double.infinity,
                  child: SfPdfViewer.file(


                    File(pdfController.pdfPath.value),
                    scrollDirection: PdfScrollDirection.vertical,
                  ),
                ),
              ),
            ),
          );
        } else {
          return Center(child: Text('Error loading PDF'));
        }
      }),
    );
  }
}

