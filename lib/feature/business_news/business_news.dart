import 'package:flutter/material.dart';
import 'package:news_app/config/network/network_request.dart';
import 'package:news_app/feature/business_news/business_news_model.dart';
import 'package:news_app/feature/extended_news.dart';

class BusinessNews extends StatefulWidget {
  const BusinessNews({Key? key, this.recievedIndex, this.neverScroll = false, this.setPadding = true})
      : super(key: key);
  final int? recievedIndex;
  final bool neverScroll;
  final bool setPadding;

  @override
  State<BusinessNews> createState() => _BusinessNewsState();
}

class _BusinessNewsState extends State<BusinessNews> {
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        NetworkRequest().getBusinessNews();
      },
      child: FutureBuilder(
        future: NetworkRequest().getBusinessNews(),
        builder: (context, snapshot) {
          // var newss = widget.recievedIndex ?? 0;
          if (snapshot.hasData) {
            return ListView.separated(
              physics: widget.neverScroll
                  ? const NeverScrollableScrollPhysics()
                  : const AlwaysScrollableScrollPhysics(),
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
                        padding: const EdgeInsets.all(6.0),
                        child: Column(
                          children: [
                            Text(news?.title ?? ''),
                            const SizedBox(
                              height: 8,
                            ),
                            Image.network(news?.urlToImage ?? ''),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(news?.description ?? ''),
                            const SizedBox(
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
                                const SizedBox(
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
                  return const SizedBox(
                    height: 0,
                  );
                }
              },
              separatorBuilder: (BuildContext context, int index) {
                return const Divider();
              },
            );
          } else if (snapshot.hasError) {
            return Text(
              snapshot.error.toString(),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
