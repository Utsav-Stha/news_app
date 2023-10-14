import 'package:flutter/material.dart';
import 'package:news_app/config/network/network_request.dart';

class BusinessNews extends StatelessWidget {
  const BusinessNews({Key? key}) : super(key: key);

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
              shrinkWrap: true,
              itemCount: snapshot.data?.length ?? 0,
              itemBuilder: (context, index) {
                var data = snapshot.data?.elementAt(index);
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text(data?.title ?? ''),
                          SizedBox(
                            height: 8,
                          ),
                          Image.network(data?.urlToImage ?? ''),
                          SizedBox(
                            height: 8,
                          ),
                          Text(data?.description ?? ''),
                          SizedBox(
                            height: 8,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                flex: 3,
                                child: Text(
                                  data?.author ?? '',
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  // softWrap: true,
                                ),
                              ),
                              SizedBox(width: 20,),
                              Expanded(
                                // flex: 2,
                                child: Text(data?.publishedAt ?? ''),
                              ),
                            ],
                          ),
                        ],
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
