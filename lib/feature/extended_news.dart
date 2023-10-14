import 'package:flutter/material.dart';
import 'package:news_app/feature/business_news/business_news.dart';
import 'package:news_app/feature/tech_crunch_news/tech_crunch_news.dart';

class ExtendedNews extends StatelessWidget {
  const ExtendedNews({Key? key, this.newsType, this.newsContent, this.newsDescription, this.newsImage, this.newsTitle, this.newsUrl}) : super(key: key);
  final String? newsType;
  final String? newsTitle;
  final String? newsImage;
  final String? newsDescription;
  final String? newsContent;
  final String? newsUrl;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: (){
              Navigator.pop(context);
            }, icon: Icon(Icons.arrow_back_ios_rounded,size: 20,)),
        centerTitle: true,
        title: Text(newsTitle!),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(newsTitle?? ''),
                SizedBox(
                  height: 10.0,
                ),
                Image.network(newsImage?? ''),
                SizedBox(
                  height: 12.0,
                ),
                Text(newsDescription?? ''),
                SizedBox(
                  height: 10.0,
                ),
                Text('Content:'),
                SizedBox(
                  height: 12.0,
                ),
                Text(newsDescription ?? ''),
                Text('See more:'),
                SizedBox(
                  height: 8.0,

                ),
                Text(newsUrl?? ''),
                SizedBox(
                  height: 12.0,
                ),

                newsType =='tech'? TechCrunchNews(
                  neverScroll: true,
                ):
                    BusinessNews(
                      neverScroll: true,
                    ),


              ],
            ),
          ),
        )
      ),
    );
  }
}
