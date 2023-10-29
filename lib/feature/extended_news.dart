import 'package:flutter/material.dart';
import 'package:news_app/feature/business_news/business_news.dart';
import 'package:news_app/feature/business_news/business_news_model.dart';
import 'package:news_app/feature/similar_news.dart';
import 'package:news_app/feature/tech_crunch_news/tech_crunch_news.dart';

class ExtendedNews extends StatelessWidget {
  const ExtendedNews(
      {Key? key,
      this.newsType,
      this.newsContent,
      this.newsDescription,
      this.newsImage,
      this.newsTitle,
      this.newsUrl,
      this.currentIndex,
      this.future})
      : super(key: key);

  final String? newsType;

  final String? newsTitle;
  final String? newsImage;
  final String? newsDescription;
  final String? newsContent;
  final String? newsUrl;
  final int? currentIndex;
  final Future<dynamic>? future;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leadingWidth: 36,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios_rounded,
              size: 20,
            )),
        centerTitle: true,
        title: Text(
          newsTitle!,
          maxLines: 2,
          style: TextStyle(
            fontSize: 14,
          ),
        ),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            // physics: AlwaysScrollableScrollPhysics(),
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                newsTitle ?? '',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 12.0,
              ),
              Image.network(newsImage ?? ''),
              const SizedBox(
                height: 12.0,
              ),
              Text(
                newsDescription ?? '',
                style: TextStyle(
                  // fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              const Text(
                'Content:',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Text(newsDescription ?? ''),
              const SizedBox(
                height: 12.0,
              ),
              const Text(
                'See more:',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: Colors.blue,
                ),
              ),

              TextButton(
                onPressed: (){},

                child: Text( newsUrl?? '',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  color: Colors.blue,
                ),),
              ),
              const SizedBox(
                height: 12.0,
              ),
             Text(
                  'Similar News:',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: Colors.purple
                  ),

              ),

              ///Similar news
              const SizedBox(
                height: 10.0,
              ),
              SimilarNews(
                currentIndex: currentIndex!,
                newsType: newsType!,
              ),
            ],
          ),
        ),
      )),
    );
  }
}
