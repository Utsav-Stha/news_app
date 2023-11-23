import 'package:dio/dio.dart';
import 'package:news_app/config/network/api_endpoint.dart';
import 'package:news_app/feature/business_news/business_news_model.dart'
    as business;
import 'package:news_app/feature/tech_crunch_news/technews_model.dart' as tech;

import 'network_interceptor.dart';

class NetworkRequest {
  // static late var dio = Dio();
  static  var dio =  Dio();

  NetworkRequest() {
    dio = Dio(baseOptions());

    dio.interceptors.add(NetworkInterceptor());
  }

  BaseOptions baseOptions() {
    return BaseOptions(
      baseUrl: APIEndPoint.baseUrl,
      headers: {
        'accept': 'application/json',
        'content-type': 'application/json',
      },
      connectTimeout: Duration(seconds: 5),
      receiveTimeout: Duration(seconds: 5),
    );
  }

   Future<List<tech.Articles>?> getTechCrunchNews() async {
    final techResponse = await dio.get(APIEndPoint.techNews);
    // print("My response :  ${response.data}");
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
    final businessResponse = await dio.get(APIEndPoint.businessNews);
    print(businessResponse.statusCode);
    if (businessResponse.statusCode == 200 ||
        businessResponse.statusCode == 201) {
      return business.BusinessNewsModel.fromJson(businessResponse.data)
              .articles ??
          [];
    }
    return [];
  }

  static Future<List<tech.Articles>?> getWallStreetNews() async {
    final wallStreetResponse = await dio.get(APIEndPoint.techNews);
    // print("My response :  ${response.data}");
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
