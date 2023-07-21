import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/src/ui/screens/article/bloc/article_bloc.dart';
import 'package:news_app/src/ui/screens/article/models/article_model.dart';
import 'package:news_app/src/ui/components/image_container.dart';
import 'package:news_app/src/ui/themes/themes.dart';
import 'package:news_app/src/ui/utils/input_formatter.dart';

class CategoryNews extends StatefulWidget {
  const CategoryNews({
    super.key,
    required this.tabs,
    required this.articles,
  });

  final List<String> tabs;
  final List<ArticleModel> articles;

  @override
  State<CategoryNews> createState() => _CategoryNewsState();
}

class _CategoryNewsState extends State<CategoryNews> {
  late ArticleBloc articleBloc;

  List<String> tabs = [
    'general',
    'entertainment',
    'business',
    'health',
    'science',
    'sports',
    'technology'
  ];

  @override
  void initState() {
    articleBloc = BlocProvider.of<ArticleBloc>(context);
    articleBloc.loadNewsByCategory();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          onTap: (index) async => await articleBloc.loadNewsByCategory(
            category: tabs[index],
          ),
          isScrollable: true,
          indicatorColor: black,
          tabs: widget.tabs
              .map(
                (tab) => Tab(
                  icon: Text(
                    tab.capitalize(),
                    style: TypographyStyle.h5.black.w700,
                  ),
                ),
              )
              .toList(),
        ),
        const SizedBox(height: 10.0),
        SizedBox(
          height: MediaQuery.of(context).size.height,
          child: TabBarView(
            children: widget.tabs
                .map(
                  (tab) => BlocBuilder<ArticleBloc, ArticleState>(
                    builder: (context, state) {
                      if (state.isLoadingNews) {
                        return const Center(
                          child: CircularProgressIndicator(
                            color: blue500,
                          ),
                        );
                      }

                      return RefreshIndicator(
                        onRefresh: () async =>
                            await articleBloc.loadNewsByCountry(),
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: widget.articles.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () => Navigator.pushNamed(
                                context,
                                '/article',
                                arguments: state.news[index],
                              ),
                              child: Row(
                                children: [
                                  ImageContainer(
                                    width: 80.0,
                                    height: 80.0,
                                    margin: const EdgeInsets.all(10.0),
                                    borderRadius: 5.0,
                                    imageUrl: state.news[index].urlToImage!,
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          state.news[index].title ?? '',
                                          maxLines: 2,
                                          overflow: TextOverflow.clip,
                                          style: TypographyStyle.st3.w700,
                                        ),
                                        const SizedBox(height: 10.0),
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.schedule,
                                              size: 18.0,
                                              color: bluegrey,
                                            ),
                                            const SizedBox(width: 5.0),
                                            Text(
                                              '${DateTime.now().difference(state.news[index].publishedAt!).inHours} hours ago',
                                              style: TypographyStyle
                                                  .st3.bluegrey.w700,
                                            ),
                                            const SizedBox(width: 20.0),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }
}
