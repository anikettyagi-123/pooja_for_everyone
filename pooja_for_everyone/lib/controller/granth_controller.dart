// import 'package:get/get.dart';
// import 'package:flutter_cache_manager/flutter_cache_manager.dart';
// import '../../firebase/granth.dart';
//
// class PdfController extends GetxController {
//   var isLoading = true.obs;
//   var pdfUrl = ''.obs;
//   final String collectionName;
//   final String documentId;
//   final String fieldName;
//
//   PdfController({
//     required this.collectionName,
//     required this.documentId,
//     required this.fieldName,
//   });
//
//   @override
//   void onInit() {
//     super.onInit();
//     _loadPdfUrl();
//   }
//
//   Future<void> _loadPdfUrl() async {
//     try {
//       final url = await getGranthText(fieldName, collectionName, documentId);
//       if (url != null && url.isNotEmpty) {
//         pdfUrl.value = url;
//       } else {
//         throw 'URL is empty or null';
//       }
//     } catch (e) {
//       print('Error loading PDF URL: $e');
//     } finally {
//       isLoading.value = false;
//     }
//   }
// }
import 'package:get/get.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import '../../firebase/granth.dart';

class PdfController extends GetxController {
  var isLoading = true.obs;
  var pdfPath = ''.obs;
  final String collectionName;
  final String documentId;
  final String fieldName;

  PdfController({
    required this.collectionName,
    required this.documentId,
    required this.fieldName,
  });

  @override
  void onInit() {
    super.onInit();
    _loadPdf();
  }

  Future<void> _loadPdf() async {
    try {
      final pdfUrl = await getGranthText(fieldName, collectionName, documentId);
      final file = await DefaultCacheManager().getSingleFile(pdfUrl!);
      pdfPath.value = file.path;
    } finally {
      isLoading.value = false;
    }
  }
}

