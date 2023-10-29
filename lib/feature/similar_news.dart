import 'package:flutter/material.dart';
import 'package:news_app/feature/tech_crunch_news/tech_crunch_news.dart';
import 'package:news_app/feature/wall_street_news/wall_street_news.dart';

import 'business_news/business_news.dart';

class SimilarNews extends StatelessWidget {
  const SimilarNews({Key? key, required this.currentIndex, required this.newsType}) : super(key: key);
  final int currentIndex;
  final String newsType;
  @override
  Widget build(BuildContext context) {
    if(newsType == 'tech'){
      return TechCrunchNews(
        neverScroll: true,
        setPadding: false,
        receivedIndex: currentIndex,
      );
    }
    else   if(newsType == 'business'){
      return BusinessNews(
        neverScroll: true,
        recievedIndex: currentIndex,
        setPadding : false,
      );
    }
    else{
      return WallStreetNews(
        neverScroll: true,
        recievedIndex: currentIndex,
        setPadding : false,
      );
    }

  }
}
