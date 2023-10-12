
import 'package:dio/dio.dart';

class NetworkRequest{
  static String techNews = "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=d043b06ae6ce4a6ca8b9ec6425b24d94";

  static final dio  = Dio();
  static void getTechCrunchNews() async{
     final response =  await dio.get(techNews);
     print("My response :  ${response.data}");
  }

}