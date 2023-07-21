import 'package:flutter/material.dart';
import 'package:news_app/src/ui/components/custom_tag_bar.dart';
import 'package:news_app/src/ui/screens/article/models/article_model.dart';
import 'package:news_app/src/ui/themes/themes.dart';

class NewsHeadLine extends StatelessWidget {
  const NewsHeadLine({super.key, required this.articleModel});

  final ArticleModel articleModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.20,
          ),
          CustomTagBar(
            backgroundColor: bluegrey180,
            children: [
              Text(
                'Source: ${articleModel.source!}',
                style: TypographyStyle.b3.white.w700,
              ),
            ],
          ),
          const SizedBox(height: 20.0),
          Text(
            articleModel.description!,
            style: TypographyStyle.st4.white.bold,
          ),
        ],
      ),
    );
  }
}
