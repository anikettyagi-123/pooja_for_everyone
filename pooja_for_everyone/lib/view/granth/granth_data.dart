
import 'package:flutter/material.dart';
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
    final PdfController pdfController = Get.put(PdfController(
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
          return const Padding(
            padding: EdgeInsets.only(top: 200),
            child: Center(child: CircularProgressIndicator()),
          );
        } else if (pdfController.pdfPath.isNotEmpty) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
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


//
// import 'package:flutter/material.dart';
// import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
// import 'package:get/get.dart';
// import '../../controller/granth_controller.dart';
//
//
// class Granthdata extends StatelessWidget {
//   final String collectionName;
//   final String documentId;
//   final String fieldName;
//
//   const Granthdata({
//     super.key,
//     required this.collectionName,
//     required this.documentId,
//     required this.fieldName,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     final PdfController pdfController = Get.put(PdfController(
//       collectionName: collectionName,
//       documentId: documentId,
//       fieldName: fieldName,
//     ));
//
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.orangeAccent,
//         automaticallyImplyLeading: false,
//       ),
//       body: Obx(() {
//         if (pdfController.isLoading.value) {
//           return const Padding(
//             padding: EdgeInsets.only(top: 200),
//             child: Center(child: CircularProgressIndicator()),
//           );
//         } else if (pdfController.pdfUrl.isNotEmpty) {
//           return Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Center(
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Container(
//                   height: MediaQuery.of(context).size.height * .85,
//                   width: double.infinity,
//                   child: const PDF(
//                     pageSnap: true,
//                     pageFling: true,
//                     fitPolicy: FitPolicy.BOTH,
//                     enableSwipe: true,
//                     swipeHorizontal: true,
//                     autoSpacing: false,
//                   ).cachedFromUrl(
//                     pdfController.pdfUrl.value,
//                     placeholder: (progress) => Center(child: CircularProgressIndicator(value: progress)),
//                     errorWidget: (error) => Center(child: Text('Error loading PDF: $error')),
//                   ),
//                 ),
//               ),
//             ),
//           );
//         } else {
//           return Center(child: Text('Error loading PDF'));
//         }
//       }),
//     );
//   }
// }
//
