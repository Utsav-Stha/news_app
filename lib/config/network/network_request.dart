import 'package:dio/dio.dart';
import 'package:news_app/feature/tech_crunch_news/technews_model.dart';

class NetworkRequest {
  static String techNews =

  "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=d043b06ae6ce4a6ca8b9ec6425b24d94";

  static final dio = Dio();
  static Future<List<Articles>?> getTechCrunchNews() async {
    final response = await dio.get(techNews);
    // print("My response :  ${response.data}");

    print("Status Code: ${response.statusCode}");

    if (response.statusCode == 200 || response.statusCode == 201) {
      //do this things
      //here TechnewsModel ma json ko articles ko data matra jnxa esri
      //also check greko if empty hunxa ki nai if bho bhne empty list pathako
       return TechnewsModel.fromJson(response.data).articles ?? [];
    }
    //if condn satisfy bhyena bhne matra tala ko return huanxa
    return [];
  }
}
