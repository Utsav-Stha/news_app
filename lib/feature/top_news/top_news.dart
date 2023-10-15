import 'package:flutter/material.dart';
import 'package:news_app/feature/extended_news.dart';

import '../../config/network/network_request.dart';

class TopNews extends StatefulWidget {
   TopNews({Key? key, this.neverScroll = false}) : super(key: key);
  final bool neverScroll ;

  @override
  State<TopNews> createState() => _TopNewsState();
}

class _TopNewsState extends State<TopNews> {
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        NetworkRequest.getTopNews();
      },
      child: FutureBuilder(
        //future ma future wala task ho jun time lagxa
        future: NetworkRequest.getTopNews(),
        //snapshot bhneko current data mageko, actual data chai snapshot ma auxa
        builder: (context, snapshot) {
          // suruma connection check grne
          if (snapshot.hasData) {
            return ListView.separated(
              physics: widget.neverScroll? NeverScrollableScrollPhysics(): AlwaysScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: snapshot.data?.length ?? 0,
              itemBuilder: (context, index) {
                var news = snapshot.data?[index];

                return Padding(
                  padding: const EdgeInsets.all(8.0),
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
                            );
                          },
                        ),
                      );
                    },
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Text(news?.title ?? ''),
                            SizedBox(
                              height: 8,
                            ),
                            Image.network(news?.urlToImage ?? ''),
                            SizedBox(
                              height: 8,
                            ),
                            Text(news?.description ?? ''),
                            SizedBox(
                              height: 8,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
              },
              separatorBuilder: (BuildContext context, int index) {
                return Divider();
              },
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                "Error : ${snapshot.error}",
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
