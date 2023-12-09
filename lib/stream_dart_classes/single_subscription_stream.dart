import 'dart:async';


//1. create a streamcontroller

StreamController<String> controller = StreamController();
Future<void> main() async{

  //2. Listen to the events emitted by the StreamController
  // controller.stream.listen((event) {
  //   print(event);
  // });
  // 3. Add events to the Stream Controller with a 1 second delay
  await addDelayedData('hello');
  await addDelayedData('there');
  await addDelayedData('how');

  await addDelayedData('are');
  await addDelayedData('you');

  controller.stream.listen((event) {
    print(event);
  });

  //Close the StreamController to release resources
  controller.close();
}
//Function to add data the Stream Controller with a 1 second delay.
Future addDelayedData(String data)async{
  await Future.delayed(Duration(seconds: 1));
  controller.add(data);
}

