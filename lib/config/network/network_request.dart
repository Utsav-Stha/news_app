import 'package:dio/dio.dart';
import 'package:news_app/feature/business_news/business_news_model.dart' as business;
import 'package:news_app/feature/tech_crunch_news/technews_model.dart' as tech;

class NetworkRequest {
  static String techNews = "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=d043b06ae6ce4a6ca8b9ec6425b24d94";
  static String businessNews = "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=d043b06ae6ce4a6ca8b9ec6425b24d94";

  static final dio = Dio();

  static Future<List<tech.Articles>?> getTechCrunchNews() async {
    final techResponse = await dio.get(techNews);
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

  static Future<List<business.Articles>?> getBusinessNews() async{
    final businessResponse = await dio.get(businessNews);
    print(businessResponse.statusCode);
    if(businessResponse.statusCode ==200 || businessResponse.statusCode == 201){
      return business.BusinessNewsModel.fromJson(businessResponse.data).articles;
    }
    return [];
  }
}
