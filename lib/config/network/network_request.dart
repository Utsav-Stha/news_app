import 'package:dio/dio.dart';
import 'package:news_app/config/network/api_endpoint.dart';
import 'package:news_app/feature/business_news/business_news_model.dart'
    as business;
import 'package:news_app/feature/tech_crunch_news/technews_model.dart' as tech;

import 'network_interceptor.dart';

class NetworkRequest {
  // static Dio dio;
  static var dio = Dio();
// static var dio = Dio();

  NetworkRequest() {
    dio = Dio(baseOptions());
    dio.interceptors.add(NetworkInterceptor());
  }

  BaseOptions baseOptions() {
    return BaseOptions(
      baseUrl: APIEndPoint.baseUrl,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 5),
    );
  }

  static Future<List<tech.Articles>?> getTechCrunchNews() async {
    // final techResponse = await dio.get(APIEndPoint.techNews);
    final techResponse = await dio.get(
        'https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=d043b06ae6ce4a6ca8b9ec6425b24d94');

    print("My response :  ${techResponse.data}");
    print("Status Code: ${techResponse.statusCode}");
    if (techResponse.statusCode == 200 || techResponse.statusCode == 201) {
      //do this things
      //here TechnewsModel ma json ko articles ko data matra jnxa esri
      //also check greko if empty hunxa ki nai if bho bhne empty list pathako
      return tech.TechnewsModel.fromJson(techResponse.data).articles ?? [];
    }
    //if condn satisfy bhyena bhne matra tala ko return huanxa
    return [];
  }

  static Future<List<business.Articles>?> getBusinessNews() async {
    print("Get Business news");
    // final businessResponse = await dio.get(APIEndPoint.businessNews);

    final businessResponse = await dio.get(
        'https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=d043b06ae6ce4a6ca8b9ec6425b24d94');
    print(businessResponse.statusCode);
    print(businessResponse.data);
    if (businessResponse.statusCode == 200 ||
        businessResponse.statusCode == 201) {
      print(
          'Inside Network Request : ${business.BusinessNewsModel.fromJson(businessResponse.data).articles}');
      return business.BusinessNewsModel.fromJson(businessResponse.data)
              .articles ??
          [];
    }
    return [];
  }

  static Future<List<tech.Articles>?> getWallStreetNews() async {
    // final wallStreetResponse = await dio.get(APIEndPoint.techNews);
    // print("My response :  ${response.data}");

    final wallStreetResponse = await dio.get(
        'https://newsapi.org/v2/everything?domains=wsj.com&apiKey=d043b06ae6ce4a6ca8b9ec6425b24d94');
    print("Status Code: ${wallStreetResponse.statusCode}");
    if (wallStreetResponse.statusCode == 200 ||
        wallStreetResponse.statusCode == 201) {
      //do this things
      //here TechnewsModel ma json ko articles ko data matra jnxa esri
      //also check greko if empty hunxa ki nai if bho bhne empty list pathako
      return tech.TechnewsModel.fromJson(wallStreetResponse.data).articles ??
          [];
    }
    //if condn satisfy bhyena bhne matra tala ko retu rn huanxa
    return [];
  }

  // static void submitUserLogin(Map userData) {
  //   //TODO Send data to backend server using post API
  //   dio.post();
  // }
}
