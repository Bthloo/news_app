import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_aoo/api/model/NewsResponse.dart';
import 'package:news_aoo/api/model/SourcesResponse.dart';
class ApiManager{
  // https://newsapi.org/v2/top-headlines/sources?apiKey=30c70a32f0d7443991e85aaed86e6086
 static const String baseUrl = 'newsapi.org';
 // bthloo api 9ccc065120104c2bba0aab3369a2b07e

 static const String apiKey = '9ccc065120104c2bba0aab3369a2b07e';

  static Future <SourcesResponse> getNewsSources(String category)async{
    var uri = Uri.https(baseUrl,'v2/top-headlines/sources',
    {
      'apiKey' : apiKey,
      'category' : category
    }
    );
   var response =  await http.get(uri);
   var jsonString = response.body;
   var sourcesResponse = SourcesResponse.fromJson(jsonDecode(jsonString));
   return sourcesResponse ;
  }

  static Future <NewsResponse> getNewsData({String? sourceId, String? searchKeyword})async{
    var uri = Uri.http(baseUrl,'v2/everything',
        {
          'apiKey' : apiKey,
          'sources' : sourceId,
          'q' : searchKeyword
        },
    );
    var response =  await http.get(uri);
    var jsonString = response.body;
    var newsResponse = NewsResponse.fromJson(jsonDecode(jsonString));
    return newsResponse ;
  }
}