// import 'package:flutter/material.dart';
// import '../../firebase/fetching_news.dart'; // Ensure this import path is correct
//
// class NewsPage extends StatelessWidget {
//   const NewsPage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: Colors.grey,
//         body: FutureBuilder<List<Map<String, dynamic>>?>(
//           future: getNewsList(),
//           builder: (context, snapshot) {
//             if (snapshot.connectionState == ConnectionState.waiting) {
//               // Show a loading indicator while fetching data
//               return Center(child: CircularProgressIndicator());
//             } else if (snapshot.hasError) {
//               // Show an error message if an error occurred
//               return Center(child: Text('Error fetching news'));
//             } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//               // Show a message if no data is found
//               return Center(child: Text('No news found', style: TextStyle(color: Colors.black)));
//             } else {
//               // Display the news items in a PageView
//               List<Map<String, dynamic>> newsList = snapshot.data!;
//
//               return Container(
//                 height: MediaQuery.of(context).size.height * 1,
//                 width: MediaQuery.of(context).size.width * 1,
//                 child: PageView.builder(
//                   scrollDirection: Axis.vertical,
//                   itemCount: newsList.length,
//                   itemBuilder: (context, index) {
//                     Map<String, dynamic> newsItem = newsList[index];
//                     String imageUrl = newsItem['downloadLink'] ?? '';
//
//                     return Column(
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         if (imageUrl.isNotEmpty)
//                           Image.network(
//                             imageUrl,
//                             fit: BoxFit.fill,
//                             height: MediaQuery.of(context).size.height * .96,
//                             width: MediaQuery.of(context).size.width * 1,
//                             errorBuilder: (context, error, stackTrace) {
//                               return Center(
//                                 child: Text('No News Available', style: TextStyle(color: Colors.black)),
//                               );
//                             },
//                           ),
//                         if (imageUrl.isEmpty)
//                           Center(
//                             child: Text('No image available', style: TextStyle(color: Colors.black)),
//                           ),
//                       ],
//                     );
//                   },
//                 ),
//               );
//             }
//           },
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import '../../controller/video_news_controller.dart';
import '../../firebase/fetching_news.dart';


class NewsPage extends StatelessWidget {
  const NewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey,
        body: FutureBuilder<List<Map<String, dynamic>>?>(
          future: getNewsList(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              // Show a loading indicator while fetching data
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              // Show an error message if an error occurred
              return Center(child: Text('Error fetching news'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              // Show a message if no data is found
              return Center(child: Text('No news found', style: TextStyle(color: Colors.black)));
            } else {
              // Display the news items in a PageView
              List<Map<String, dynamic>> newsList = snapshot.data!;

              return Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
                child: PageView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: newsList.length,
                  itemBuilder: (context, index) {
                    Map<String, dynamic> newsItem = newsList[index];
                    String fileType = newsItem['fileType'] ?? '';
                    String downloadLink = newsItem['downloadLink'] ?? '';

                    if (fileType == 'image') {
                      return CachedNetworkImage(
                        imageUrl: downloadLink,
                        fit: BoxFit.fill,
                        height: MediaQuery.of(context).size.height * .96,
                        width: MediaQuery.of(context).size.width,
                        errorWidget: (context, url, error) => Center(
                          child: Text('Error loading image', style: TextStyle(color: Colors.black)),
                        ),
                      );
                    } else if (fileType == 'video') {
                      return VideoPlayerWidget(videoUrl: downloadLink);
                    } else if (fileType == 'pdf') {
                      return SfPdfViewer.network(downloadLink);
                    } else {
                      return Center(
                        child: Text('Unsupported file type', style: TextStyle(color: Colors.black)),
                      );
                    }
                  },
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
class VideoPlayerWidget extends StatelessWidget {
  final String videoUrl;

  const VideoPlayerWidget({super.key, required this.videoUrl});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<VideoController>(
      init: VideoController(videoUrl),
      builder: (controller) {
        if (controller.videoPlayerController.value.isInitialized) {
          return AspectRatio(
            aspectRatio: controller.videoPlayerController.value.aspectRatio,
            child: VideoPlayer(controller.videoPlayerController),
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}