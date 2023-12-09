import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class StreamWidget extends StatelessWidget {
  StreamWidget({Key? key}) : super(key: key);
  final StreamController<Map<String,dynamic>> controller = StreamController<Map<String,dynamic>>();
  List photos = [
    "assets/images/1.png",
    "assets/images/2.png",
    "assets/images/3.png",
    "assets/images/4.png",
  ];


  @override
  Widget build(BuildContext context) {

    addStreamTextData();
    // addStreamImageData();

    return Scaffold(
      appBar:  AppBar(
        title: Text('Stream builder example'),
      ),
      body: StreamBuilder<Map<String,dynamic>>(
        stream: controller.stream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            return Center(


              child: Column(
                children: [
                  Container(
                    height: 200,
                    width: 200,
                    child: Image.asset(snapshot.data!['image']?? ''),
                  ),
                  Container(
                    height: 200,
                    width: 200,
                    child: Text(snapshot.data!['data']??''),
                  ),
                ],
              ),

            );
          }
          else{
            return const Center(
              child:CircularProgressIndicator() ,
            );
          }
        },
      ),
    );
  }
   addDelayedData(String data, String image)async{
    await Future.delayed(Duration(seconds: 2));
    controller.add({'image': image, 'data' :data});
  }

  // Future<void> addStreamImageData() async{
  //
  //
  //
  //   await addDelayedData(photos[0]);
  //   await addDelayedData(photos[1]);
  //   await addDelayedData(photos[2]);
  //   await addDelayedData(photos[3]);
  //
  //
  // }
  Future<void> addStreamTextData() async{
    // Add events to the StreamController with a 1 second delay
    await addDelayedData('hello',photos[0]);
    await addDelayedData('there',photos[1]);
    await addDelayedData('how',photos[2]);
    await addDelayedData('are',photos[3]);
    await addDelayedData('you',photos[3]);





  }
}





