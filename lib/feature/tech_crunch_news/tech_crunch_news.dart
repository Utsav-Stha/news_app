import 'package:flutter/material.dart';
import 'package:news_app/feature/tech_crunch_news/technews_model.dart';

import '../../config/network/network_request.dart';

class TechCrunchNews extends StatefulWidget {
  const TechCrunchNews({Key? key}) : super(key: key);

  @override
  State<TechCrunchNews> createState() => _TechCrunchNewsState();
}

class _TechCrunchNewsState extends State<TechCrunchNews> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TechNews'),
      ),
      body: RefreshIndicator(
        onRefresh: ()async{
          NetworkRequest.getTechCrunchNews();
        },
        child: ListView(
          shrinkWrap: true,
          children: [
            FutureBuilder(
              //future ma future wala task ho jun time lagxa
              future: NetworkRequest.getTechCrunchNews(),
              //snapshot bhneko current data mageko, actual data chai snapshot ma auxa
              builder: (context, snapshot) {
                // suruma connection check grne
                if (snapshot.hasData) {

                  return ListView.separated(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                      itemCount: snapshot.data?.length ?? 0,
                      itemBuilder: (context,index){
                      var news = snapshot.data?[index];

                        return Padding(
                          padding: const EdgeInsets.all(8.0),
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
                        );
                      }, separatorBuilder: (BuildContext context, int index) { return Divider(); },);
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
            )
          ],
        ),
      ),
    );
  }
}
