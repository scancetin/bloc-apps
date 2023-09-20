import 'package:clean_arch_news_app/core/resources/data_state.dart';
import 'package:clean_arch_news_app/features/daily_news/data/models/models.dart';
import '../../domain/repositories/article_repository.dart';

class ArticleRepositoryImpl implements ArticleRepository {
  @override
  Future<DataState<List<ArticleModel>>> getNewsArticle() {
    throw UnimplementedError();
  }
}
