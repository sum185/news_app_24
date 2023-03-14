import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app_24/screen/Home_Sc/Home_Model/News_Model.dart';

class ApiHelper{

  ApiHelper._();
  static ApiHelper apiHelper = ApiHelper._();


  // Get News Api.....

  Future<NewsModel?> getNewsData(String name)async{

  String apiLink = "https://newsapi.org/v2/everything?q=$name&from=2023-02-14&sortBy=publishedAt&apiKey=3eac0869045e4100bea193d18d9019c4";
  var response = await http.get(Uri.parse(apiLink));

  if(response.statusCode==200){
    var json = jsonDecode(response.body);
    return NewsModel.fromJson(json);
  }
  return null;
  }
}