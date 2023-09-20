import 'dart:io';

import 'package:clean_arch_news_app/core/constants/constants.dart';
import 'package:clean_arch_news_app/core/resources/data_state.dart';
import 'package:clean_arch_news_app/features/daily_news/data/data_sources/remote/news_api_service.dart';
import 'package:clean_arch_news_app/features/daily_news/data/models/models.dart';
import 'package:dio/dio.dart';
import '../../domain/repositories/article_repository.dart';

class ArticleRepositoryImpl implements ArticleRepository {
  final NewsApiService _newsApiService;
  ArticleRepositoryImpl(this._newsApiService);

  @override
  Future<DataState<List<ArticleModel>>> getNewsArticle() async {
    try {
      final httpResponse = await _newsApiService.getNewsArticles(
        apiKey: newsAPIKey,
        country: countryQuery,
        category: categoryQuery,
      );

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailed(DioException(
          error: httpResponse.response.statusCode,
          response: httpResponse.response,
          type: DioExceptionType.badResponse,
          requestOptions: httpResponse.response.requestOptions,
        ));
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }
}
