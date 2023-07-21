part of 'article_bloc.dart';

class ArticleState extends Equatable {
  final bool isLoadingNews;
  final bool hasErrorLoadingNews;
  final List<ArticleModel> news;

  const ArticleState({
    this.isLoadingNews = true,
    this.hasErrorLoadingNews = true,
    this.news = const [],
  });

  @override
  List<Object> get props => [isLoadingNews, news];

  ArticleState copyWith({
    bool? isLoadingNews,
    bool? hasErrorLoadingNews,
    List<ArticleModel>? news,
  }) {
    return ArticleState(
      isLoadingNews: isLoadingNews ?? this.isLoadingNews,
      hasErrorLoadingNews: hasErrorLoadingNews ?? this.hasErrorLoadingNews,
      news: news ?? this.news,
    );
  }
}

class ArticleInitial extends ArticleState {}
