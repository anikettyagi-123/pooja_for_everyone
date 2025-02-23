import 'package:flutter/material.dart';

import 'chapter_global.dart';

class ChapterView extends StatelessWidget {
  final String collectionName;

  final String documentId;

  const ChapterView(
      {super.key, required this.collectionName, required this.documentId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Bhagavad Gita',style: TextStyle(fontSize: 25),)),
          backgroundColor: Colors.orangeAccent,
          automaticallyImplyLeading: false,
        ),
        body: Stack(

          children: [
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height *.01),
              child: Center(
                  child: Image.asset(
                    'assets/back.png',
                    color: Colors.grey.shade200,
                  )),
            ),
            Column(children: [
              SizedBox(
                height:  MediaQuery.of(context).size.height * .02
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ViewWidget(
                    documentId: documentId,
                    collectionName: collectionName,
                    chapterNo: 'Chapter1',
                  ),
                  ViewWidget(
                    documentId: documentId,
                    collectionName: collectionName,
                    chapterNo: 'Chapter2',
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .01,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ViewWidget(
                    documentId: documentId,
                    collectionName: collectionName,
                    chapterNo: 'Chapter3',
                  ),
                  ViewWidget(
                    documentId: documentId,
                    collectionName: collectionName,
                    chapterNo: 'Chapter4',
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .01,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ViewWidget(
                    documentId: documentId,
                    collectionName: collectionName,
                    chapterNo: 'Chapter5',
                  ),
                  ViewWidget(
                    documentId: documentId,
                    collectionName: collectionName,
                    chapterNo: 'Chapter6',
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .01,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ViewWidget(
                    documentId: documentId,
                    collectionName: collectionName,
                    chapterNo: 'Chapter7',
                  ),
                  ViewWidget(
                    documentId: documentId,
                    collectionName: collectionName,
                    chapterNo: 'Chapter8',
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .01,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ViewWidget(
                    documentId: documentId,
                    collectionName: collectionName,
                    chapterNo: 'Chapter9',
                  ),
                  ViewWidget(
                    documentId: documentId,
                    collectionName: collectionName,
                    chapterNo: 'Chapter10',
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .01,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ViewWidget(
                    documentId: documentId,
                    collectionName: collectionName,
                    chapterNo: 'Chapter11',
                  ),
                  ViewWidget(
                    documentId: documentId,
                    collectionName: collectionName,
                    chapterNo: 'Chapter12',
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .01,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ViewWidget(
                    documentId: documentId,
                    collectionName: collectionName,
                    chapterNo: 'Chapter13',
                  ),
                  ViewWidget(
                    documentId: documentId,
                    collectionName: collectionName,
                    chapterNo: 'Chapter14',
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .01,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ViewWidget(
                    documentId: documentId,
                    collectionName: collectionName,
                    chapterNo: 'Chapter15',
                  ),
                  ViewWidget(
                    documentId: documentId,
                    collectionName: collectionName,
                    chapterNo: 'Chapter16',
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .01,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ViewWidget(
                    documentId: documentId,
                    collectionName: collectionName,
                    chapterNo: 'Chapter17',
                  ),
                  ViewWidget(
                    documentId: documentId,
                    collectionName: collectionName,
                    chapterNo: 'Chapter18',
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .01,
              ),
            ]),
          ],
        ));
  }
}
