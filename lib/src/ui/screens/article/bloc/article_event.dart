part of 'article_bloc.dart';

abstract class ArticleEvent extends Equatable {
  const ArticleEvent();

  @override
  List<Object> get props => [];
}

class OnLoadArticleEvent extends ArticleEvent {
  final List<ArticleModel> news;
  const OnLoadArticleEvent({required this.news});
}

class OnErrorLoadingArticleEvent extends ArticleEvent {
  const OnErrorLoadingArticleEvent();
}

class OnToggleLoadingArticleEvent extends ArticleEvent {
  final bool isLoadingNews;
  const OnToggleLoadingArticleEvent({required this.isLoadingNews});
}
