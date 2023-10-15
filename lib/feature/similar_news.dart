import 'package:flutter/material.dart';

class SimilarNews extends StatelessWidget {
   SimilarNews({Key? key, this.future}) : super(key: key);
  Future<dynamic>?  future;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: future,
        builder: (context, snapshot) {

        },);
  }
}
