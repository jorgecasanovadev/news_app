import 'dart:convert';
import 'dart:developer';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:news_app/src/data/network/failure_error_handler.dart';
import 'package:news_app/src/data/network/http_handler.dart';
import 'package:news_app/src/ui/screens/article/models/article_model.dart';

class NewsApi {
  final String _newsKey = dotenv.get('NEWS_ACCESS_TOKEN');

  HttpHandler httpHandler = HttpHandler();

  Future<List<ArticleModel>> newsByCountry({
    String countryCode = 'us',
  }) async {
    try {
      final data =
          await httpHandler.get('country=$countryCode&apiKey=$_newsKey');
      final response = json.decode(data.body);
      List<ArticleModel> articleModels = [
        for (final article in response['articles'])
          ArticleModel.fromMap(article)
      ];
      return articleModels;
    } on Failure catch (e) {
      log('Error ${e.statusCode}: ${e.message}');
      rethrow;
    }
  }

  Future<List<ArticleModel>> newsByCategory({
    String countryCode = 'us',
    String categoryType = 'general',
  }) async {
    try {
      final data = await httpHandler.get(
        'country=$countryCode&category=$categoryType&apiKey=$_newsKey',
      );
      final response = json.decode(data.body);
      List<ArticleModel> articleModels = [
        for (final article in response['articles'])
          ArticleModel.fromMap(article)
      ];
      return articleModels;
    } on Failure catch (e) {
      log('Error ${e.statusCode}: ${e.message}');
      rethrow;
    }
  }
}
