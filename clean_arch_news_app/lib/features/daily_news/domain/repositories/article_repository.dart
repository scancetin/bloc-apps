import 'package:clean_arch_news_app/features/daily_news/domain/entities/article.dart';
import '../../../../core/resources/data_state.dart';

abstract class ArticleRepository {
  Future<DataState<List<ArticleEntity>>> getNewsArticle();
}
