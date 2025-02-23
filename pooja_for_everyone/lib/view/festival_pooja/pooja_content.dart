



import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pooja_for_everyone/controller/festival_controller.dart';

import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';


class PoojaVidhi extends StatelessWidget {
  final String godName;

  final String fieldName;

  const PoojaVidhi({super.key,required this.fieldName,required this.godName});

  @override
  Widget build(BuildContext context) {
    final festivalPdfController = Get.put(FestivalPdfController(fieldName: fieldName));
    return Scaffold(

      appBar: AppBar(
        title: Center(child: Text(godName.tr,style: TextStyle(fontSize: 20),)),
        backgroundColor: Colors.orangeAccent,
        automaticallyImplyLeading: false,

      ),
      body: Obx((){
        if(festivalPdfController.isLoading.value){
          return const Padding(
            padding: EdgeInsets.only(top: 8.0),
            child: Center(child: CircularProgressIndicator()),
          );
        }else if(festivalPdfController.pdfPath.isNotEmpty){
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: MediaQuery.of(context).size.height*.85,
                width: double.infinity,
                child: SfPdfViewer.file(
                  File(festivalPdfController.pdfPath.value),
                  scrollDirection: PdfScrollDirection.vertical,
                ),

              ),
            ),
          );
        }else {
          return const Center(child: Text('NO Data Found'));
        }

    }

      ));
  }
}
