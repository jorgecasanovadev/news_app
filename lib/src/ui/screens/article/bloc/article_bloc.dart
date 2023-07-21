import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:news_app/src/data/network/news_api.dart';
import 'package:news_app/src/ui/screens/article/models/article_model.dart';
import 'package:news_app/src/ui/utils/toast.dart';

part 'article_event.dart';
part 'article_state.dart';

class ArticleBloc extends Bloc<ArticleEvent, ArticleState> {
  ArticleBloc() : super(ArticleInitial()) {
    on<ArticleEvent>((event, emit) {});

    on<OnToggleLoadingArticleEvent>((event, emit) {
      if (state.isLoadingNews != event.isLoadingNews) {
        emit(state.copyWith(isLoadingNews: event.isLoadingNews));
      }
    });

    on<OnLoadArticleEvent>((event, emit) {
      emit(state.copyWith(
        isLoadingNews: false,
        hasErrorLoadingNews: false,
        news: [...event.news],
      ));
    });

    on<OnErrorLoadingArticleEvent>((event, emit) {
      emit(state.copyWith(
        hasErrorLoadingNews: true,
        isLoadingNews: false,
      ));
    });
  }

  final NewsApi _apiRemote = NewsApi();

  Future<void> loadNewsByCountry({String countryCode = 'us'}) async {
    add(const OnToggleLoadingArticleEvent(isLoadingNews: true));
    final news = <ArticleModel>[];
    try {
      news.addAll(
        await _apiRemote.newsByCountry(countryCode: countryCode),
      );
      add(OnLoadArticleEvent(news: news));
    } catch (e) {
      add(const OnErrorLoadingArticleEvent());
      unawaited(
        ToastMessages.showError('Error al cargar las noticias'),
      );
    } finally {
      add(const OnToggleLoadingArticleEvent(isLoadingNews: false));
    }
  }

  Future<void> loadNewsByCategory({String category = 'general'}) async {
    add(const OnToggleLoadingArticleEvent(isLoadingNews: true));
    final news = <ArticleModel>[];
    try {
      news.addAll(
        await _apiRemote.newsByCategory(categoryType: category),
      );
      add(OnLoadArticleEvent(news: news));
    } catch (e) {
      add(const OnErrorLoadingArticleEvent());
      unawaited(
        ToastMessages.showError('Error al cargar las noticias'),
      );
    } finally {
      add(const OnToggleLoadingArticleEvent(isLoadingNews: false));
    }
  }
}
