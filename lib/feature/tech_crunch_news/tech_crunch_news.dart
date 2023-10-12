import 'package:flutter/material.dart';

import '../../config/network/network_request.dart';

class TechCrunchNews extends StatefulWidget {
  const TechCrunchNews({Key? key}) : super(key: key);

  @override
  State<TechCrunchNews> createState() => _TechCrunchNewsState();
}

class _TechCrunchNewsState extends State<TechCrunchNews> {
  @override
  Widget build(BuildContext context) {

    NetworkRequest.getTechCrunchNews();

    return Scaffold(
      body: ListView(
        children: [
          Text('TEch News'),
        ],
      ),
    );
  }
}
