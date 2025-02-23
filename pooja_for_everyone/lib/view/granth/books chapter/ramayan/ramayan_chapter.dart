

import 'package:flutter/material.dart';

import 'chapter_global.dart';

class RamayanChapter extends StatelessWidget {
  final String collectionName;
  final String documentId;

  const RamayanChapter({super.key,required this.documentId,required this.collectionName});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child:Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    RamayanChapterGlobal(fieldName: 'ch1', chapterName: 'Chapter1\nबालकाण्ड',
                      imagePath: 'https://i.ytimg.com/vi/-YCwDCHbbNE/sddefault.jpg',
                      collectionName: collectionName, documentId: documentId,),
                    RamayanChapterGlobal(fieldName: 'ch2', chapterName: 'Chapter2\nअयोध्याकाण्ड',
                      imagePath: 'https://www.vyasaonline.com/wp-content/uploads/2017/11/india-vintage-calendar-print-hindu-god-ram-sita-laxman-bharat-with-khadaau-gngp9-4ce242bd2a4293791e051a7d19c62339.jpg',
                      collectionName: collectionName, documentId: documentId,),
            
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height*.03,

                ),
                Row(
                  children: [
                    RamayanChapterGlobal(fieldName: 'ch3', chapterName: 'Chapter3\nअरण्य काण्ड',
                      imagePath: 'https://www.kathasangrah.com/wp-content/uploads/2021/05/aranyakaand.jpg',
                      collectionName: collectionName, documentId: documentId,),
                    RamayanChapterGlobal(fieldName: 'ch4', chapterName: 'Chapter4\nकिष्किन्धा काण्ड',
                      imagePath: 'https://m.media-amazon.com/images/I/51Xrx9lzcTL.jpg',
                      collectionName: collectionName, documentId: documentId,),
            
                  ],
                ), SizedBox(
                  height: MediaQuery.of(context).size.height*.03,

                ),
                Row(
                  children: [
                    RamayanChapterGlobal(fieldName: 'ch5', chapterName: 'Chapter5\nसन्दर काण्ड',
                      imagePath: 'https://nonprod-media.webdunia.com/public_html/_media/hi/img/article/2019-07/09/full/1562655371-4963.jpg',
                      collectionName: collectionName, documentId: documentId,),
                    RamayanChapterGlobal(fieldName: 'ch6', chapterName: 'Chapter6\nलंकाकाण्ड',
                      imagePath: 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjI3Cf8b9i74Mqci18fFCfncTmF-0PqtOmH4rdDO53gVlbplJAjm2_8vVbgRJykTOjWkgffPMANCEUarbFsllF1Ig_tJryYQ3vQzcgIvyMhMTApyzxlqCMT3Y-mFqs6OGSEK-59BeivH3Nk/s1600/Lanka+Kand.jpg',
                      collectionName: collectionName, documentId: documentId,),
            
                  ],
                ), SizedBox(
                  height: MediaQuery.of(context).size.height*.03,

                ),
                RamayanChapterGlobal(fieldName: 'ch7', chapterName: 'Chapter7\nउत्तर काण्ड',
                  imagePath: 'https://www.kathasangrah.com/wp-content/uploads/2021/02/ramdarbaar.jpg',
                  collectionName: collectionName, documentId: documentId,),
                SizedBox(
                  height: MediaQuery.of(context).size.height*.03,

                ),
            
              ],
            ),
          ),
        ) );
  }
}
