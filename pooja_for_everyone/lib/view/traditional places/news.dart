import 'package:flutter/material.dart';


import '../../firebase/fetching_news.dart'; // Ensure this import path is correct

class NewsPage extends StatelessWidget {
  const NewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

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
            return Center(child: Text('No news found'));
          } else {
            // Display the news items in a PageView
            List<Map<String, dynamic>> newsList = snapshot.data!;

            return Container(
              height: MediaQuery.of(context).size.height*.8,
              width: MediaQuery.of(context).size.width*1,
              child: PageView.builder(
                scrollDirection: Axis.vertical,
                itemCount: newsList.length,
                itemBuilder: (context, index) {
                  Map<String, dynamic> newsItem = newsList[index];
                  // String title = newsItem['title'] ?? 'No Title';
                  // String description = newsItem['description'] ?? 'No Description';
                   String imageUrl = newsItem['downloadLink'] ?? '';

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      if (imageUrl.isNotEmpty)
                        Image.network(imageUrl, fit: BoxFit.fill,height: MediaQuery.of(context).size.height*.8,
                          width: MediaQuery.of(context).size.width*.98,),

                    ],
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }
}
