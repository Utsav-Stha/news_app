import 'package:flutter/material.dart';
import 'package:news_app/feature/extended_news.dart';

import '../../config/network/network_request.dart';

class TechCrunchNews extends StatefulWidget {
  TechCrunchNews(
      {Key? key,
      this.neverScroll = false,
      this.setPadding = true,
      this.receivedIndex})
      : super(key: key);
  final bool neverScroll;
  final bool setPadding;
  final int? receivedIndex;

  @override
  State<TechCrunchNews> createState() => _TechCrunchNewsState();
}

class _TechCrunchNewsState extends State<TechCrunchNews> {
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        NetworkRequest.getTechCrunchNews();
      },
      child: FutureBuilder(
        //future ma future wala task ho jun time lagxa
        future: NetworkRequest.getTechCrunchNews(),
        //snapshot bhneko current data mageko, actual data chai snapshot ma auxa
        builder: (context, snapshot) {
          // suruma connection check grne
          if (snapshot.hasData) {
            return ListView.separated(
              physics: widget.neverScroll
                  ? NeverScrollableScrollPhysics()
                  : AlwaysScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: snapshot.data?.length ?? 0,
              itemBuilder: (context, index) {
                var news = snapshot.data?[index];
                if (widget.receivedIndex != index) {
                  return Padding(
                    padding: widget.setPadding
                        ? const EdgeInsets.all(8.0)
                        : const EdgeInsets.all(0.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return ExtendedNews(
                                newsType: 'tech',
                                newsTitle: news?.title,
                                newsImage: news?.urlToImage,
                                newsDescription: news?.description,
                                newsContent: news?.content,
                                newsUrl: news?.url,
                                future: NetworkRequest.getTechCrunchNews(),
                                currentIndex: index,
                              );
                            },
                          ),
                        );
                      },
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Column(
                            children: [
                              Text(news?.title ?? ''),
                              SizedBox(
                                height: 8,
                              ),
                              Image.network(news?.urlToImage ?? 'https://cdn.pixabay.com/photo/2017/06/08/17/32/not-found-2384304_1280.jpg'),
                              SizedBox(
                                height: 8,
                              ),
                              Text(news?.description ?? ''),
                              SizedBox(
                                height: 8,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(news?.author ?? ''),
                                  Text(news?.publishedAt ?? ''),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                } else {
                  return SizedBox(
                    height: 0,
                  );
                }
              },
              separatorBuilder: (BuildContext context, int index) {
                return Divider();
              },
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                "${snapshot.error}",
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
