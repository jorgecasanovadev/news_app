import 'package:flutter/material.dart';
import 'package:news_app/src/ui/screens/article/models/article_model.dart';
import 'package:news_app/src/ui/screens/article/views/headlines_view.dart';
import 'package:news_app/src/ui/screens/article/views/news_view.dart';
import 'package:news_app/src/ui/components/image_container.dart';
import 'package:news_app/src/ui/themes/themes.dart';

class ArticleScreen extends StatelessWidget {
  const ArticleScreen({super.key, required this.articleModel});
  static const routeName = '/article';

  final ArticleModel articleModel;

  @override
  Widget build(BuildContext context) {
    return ImageContainer(
      width: double.infinity,
      imageUrl: articleModel.urlToImage!,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          iconTheme: const IconThemeData(color: white),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        extendBodyBehindAppBar: true,
        body: ListView(
          children: [
            NewsHeadLine(articleModel: articleModel),
            NewsBody(articleModel: articleModel),
          ],
        ),
      ),
    );
  }
}
