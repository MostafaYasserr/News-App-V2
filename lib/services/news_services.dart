import 'package:dio/dio.dart';
import '../models/news_model.dart';

class NewsService {
  final dio = Dio();

  Future<List<NewsModel>> getNews({required String category}) async {
    try {
      // print(category);
      Response response = await dio.get(
          'https://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=07af5e7b530e4425a16bd1ab4f866429');
      Map<String, dynamic> jsonData = response.data;
      List<dynamic> articles = jsonData["articles"];

      List<NewsModel> newsList = [];

      for (var article in articles) {
        NewsModel newsModel = NewsModel.jsonData(article);
        newsList.add(newsModel);
      }
      return newsList;
    }
    catch(e){
      return [];
    }
  }
}
