import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pooja_for_everyone/view/godMantra/Mantra_For_All.dart';

import 'allgod_global.dart';

class AllGod extends StatelessWidget {
  const AllGod({super.key});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
        child: Scaffold(
            body: SingleChildScrollView(
              child: Column(children: [
                    ALlGodGlobal(
                      godName: 'Durga Mata', documentId: 'WqYqGBGKzy5TdbUhDE37',
                    ),
                    ALlGodGlobal(
                      godName: 'Shiv Ji', documentId: 'AlqYebwSBWSgoUUB5QqP',

                    ),
                    ALlGodGlobal(
                      godName: 'Ganesh Ji', documentId: '',
                    ),
                    ALlGodGlobal(
                      godName: 'Hanuman Ji', documentId: '',
                    ),
                    ALlGodGlobal(
                      godName: 'Krisna Ji', documentId: '',
                    ),
                    ALlGodGlobal(
                      godName: 'Ram ji', documentId: '',
                    ),
                    ALlGodGlobal(
                      godName: 'Randha Rani',documentId: '',
                    ),
                    ALlGodGlobal(
                      godName: 'Parvati Mata',documentId: '',
                    ),
                    ALlGodGlobal(
                      godName: 'Lakshmi Mata',documentId: '',
                    ),
                    ALlGodGlobal(
                      godName: 'Khatu Shyam',documentId: '',
                    ),
                    ALlGodGlobal(
                      godName: 'Gau Mata ',documentId: '',
                    ),
                    ALlGodGlobal(
                      godName: 'Ganga Mata',documentId: '',
                    ),
                    ALlGodGlobal(
                      godName: 'Gayatri Mata',documentId: '',
                    ),
                ALlGodGlobal(godName: 'Sarswati Mata',documentId: '', ),
                ALlGodGlobal(godName: 'Santoshi Mata',documentId: '', ),
                ALlGodGlobal(godName: 'Tulsi Mata',documentId: '', ),
                ALlGodGlobal(godName: 'Sita Mata',documentId: '', ),
                ALlGodGlobal(godName: 'Vaishno Mata',documentId: '',),
                ALlGodGlobal(godName: 'Shani Dev',documentId: '', ),
                ALlGodGlobal(godName: 'Vishnu Ji',documentId: '', ),
                ALlGodGlobal(godName: 'Sai baba',documentId: '', ),
              
              ]),
            )));
  }
}
