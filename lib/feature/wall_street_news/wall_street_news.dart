import 'package:flutter/material.dart';
import 'package:news_app/config/network/network_request.dart';
import 'package:news_app/feature/extended_news.dart';

class WallStreetNews extends StatefulWidget {
  const WallStreetNews({Key? key, this.recievedIndex, this.neverScroll = false, this.setPadding = true})
      : super(key: key);
  final int? recievedIndex;
  final bool neverScroll;
  final bool setPadding;

  @override
  State<WallStreetNews> createState() => _WallStreetNewsState();
}

class _WallStreetNewsState extends State<WallStreetNews> {
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        NetworkRequest.getWallStreetNews();
      },
      child: FutureBuilder(
        future: NetworkRequest.getWallStreetNews(),
        builder: (context, snapshot) {
          // var newss = widget.recievedIndex ?? 0;
          if (snapshot.hasData) {
            return ListView.separated(
              physics: widget.neverScroll
                  ? NeverScrollableScrollPhysics()
                  : AlwaysScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: snapshot.data?.length ?? 0,
              itemBuilder: (context, index) {
                print('index: $index');
                print('  received index: ${widget.recievedIndex}');
                // var currentIndex =
                //     (index == widget.recievedIndex) ? index+1 : index;
                // print('curren Index : $currentIndex');
                var news = snapshot.data?[index];
                if(index != widget.recievedIndex){
                  return Padding(
                    padding: widget.setPadding? const EdgeInsets.all(12.0): const EdgeInsets.all(0.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                              return ExtendedNews(
                                newsType: 'business',
                                currentIndex: index,
                                newsTitle: news?.title,
                                newsImage: news?.urlToImage,
                                newsDescription: news?.description,
                                newsContent: news?.content,
                                newsUrl: news?.url,
                              );
                            }));
                      },
                      child: Card(
                        child: Padding(
                          padding: EdgeInsets.all(6.0),
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
                                  Expanded(
                                    flex: 3,
                                    child: Text(
                                      news?.author ?? '',
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      // softWrap: true,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Expanded(
                                    // flex: 2,
                                    child: Text(news?.publishedAt ?? ''),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );}
                else{
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
            return Text(
              snapshot.error.toString(),
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
