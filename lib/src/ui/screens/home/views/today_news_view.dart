import 'package:flutter/material.dart';
import 'package:news_app/src/ui/components/custom_tag_bar.dart';
import 'package:news_app/src/ui/components/image_container.dart';
import 'package:news_app/src/ui/screens/article/models/article_model.dart';
import 'package:news_app/src/ui/themes/themes.dart';

class NewOfTheDay extends StatelessWidget {
  const NewOfTheDay({
    super.key,
    required this.articlesModel,
  });

  final ArticleModel articlesModel;

  @override
  Widget build(BuildContext context) {
    return ImageContainer(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.45,
      padding: const EdgeInsets.all(10.0),
      imageUrl: articlesModel.urlToImage ?? '',
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            articlesModel.title ?? '',
            textAlign: TextAlign.right,
            style: TypographyStyle.h5.white,
          ),
          const SizedBox(height: 10.0),
          TextButton(
            onPressed: () => Navigator.pushNamed(
              context,
              '/article',
              arguments: articlesModel,
            ),
            style: TextButton.styleFrom(padding: EdgeInsets.zero),
            child: Align(
              alignment: Alignment.centerRight,
              child: CustomTagBar(
                backgroundColor: bluegrey180,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Learn More',
                        style: TypographyStyle.h6.white.w700,
                      ),
                      const SizedBox(width: 5.0),
                      const Icon(
                        Icons.arrow_right_alt_outlined,
                        color: white,
                        size: 30,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
