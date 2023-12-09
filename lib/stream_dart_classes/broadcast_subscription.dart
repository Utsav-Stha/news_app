import 'dart:async';


//1. create a streamcontroller
StreamController<String> controller = StreamController();

void main() {
//2. Listen to the events emitted by the StreamController


  // controller.stream.listen((event) {
  //   print('2nd listener$event');
  // });
  // 3. Add events to the Stream Controller with a 1 second delay
  // await addDelayedData('hello');
  // await addDelayedData('there');
  // await addDelayedData('how');
  //
  // await addDelayedData('are');
  // await addDelayedData('you');

  controller.add('hello');
  controller.add('hello');
  controller.add('hello');
  controller.add('hello');

  controller.stream.listen((event) {
    print('1st listener$event');

  });
  controller.close();
}





  //Close the StreamController to release resources


//Function to add data the Stream Controller with a 1 second delay.
// Future addDelayedData(String data)async{
//   await Future.delayed(Duration(seconds: 2));
//   controller.add(data);
// }

