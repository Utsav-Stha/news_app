import 'package:flutter/material.dart';
import 'package:news_app/config/network/network_request.dart';
import 'package:news_app/feature/extended_news.dart';

class BusinessNews extends StatelessWidget {
  const BusinessNews({Key? key, this.neverScroll = false}) : super(key: key);
  final bool neverScroll;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: ()async{
        NetworkRequest.getBusinessNews();
      },
      child: FutureBuilder(
        future: NetworkRequest.getBusinessNews(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.separated(
              physics: neverScroll? NeverScrollableScrollPhysics(): AlwaysScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: snapshot.data?.length ?? 0,
              itemBuilder: (context, index) {
                var news = snapshot.data?.elementAt(index);
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return ExtendedNews(
                          newsType: 'business',
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
                        padding: EdgeInsets.all(8.0),
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
                                SizedBox(width: 20,),
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
                );
              }, separatorBuilder: (BuildContext context, int index) { return Divider(); },
            );
          } else {
            return Text(snapshot.error.toString());
          }
        },
      ),
    );
  }
}
