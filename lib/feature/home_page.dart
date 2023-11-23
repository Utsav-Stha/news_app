import 'package:flutter/material.dart';
import 'package:news_app/feature/business_news/business_news.dart';
import 'package:news_app/feature/tech_crunch_news/tech_crunch_news.dart';
import 'package:news_app/feature/wall_street_news/wall_street_news.dart';
import '../../config/network/network_request.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text('Tech News'),
          ),
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            NetworkRequest().getTechCrunchNews();
          },
          child: Column(
            // shrinkWrap: true,
            children: [
              const TabBar(

                tabs: [
                  Tab(
                    text: 'Tech News',
                  ),
                  Tab(
                    text: 'Business News',
                  ),
                  Tab(
                    text: 'WallStreet News',
                  ),
                ],
              ),
              Expanded(
                child: TabBarView(
                  // physics: NeverScrollableScrollPhysics(),
                    children: [
                      TechCrunchNews(),
                      BusinessNews(),
                      WallStreetNews(),
                    ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
