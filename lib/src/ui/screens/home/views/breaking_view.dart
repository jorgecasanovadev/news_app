import 'package:flutter/material.dart';
import 'package:news_app/src/ui/screens/article/models/article_model.dart';
import 'package:news_app/src/ui/components/image_container.dart';
import 'package:news_app/src/ui/themes/themes.dart';

class BreakingNews extends StatelessWidget {
  const BreakingNews({super.key, required this.articlesModel});

  final List<ArticleModel> articlesModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Breaking News',
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .copyWith(fontWeight: FontWeight.w600),
              ),
              Text(
                'More',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ],
          ),
          const SizedBox(height: 20.0),
          SizedBox(
            height: 300,
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              scrollDirection: Axis.vertical,
              itemCount: articlesModel.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.only(right: 10.0),
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: InkWell(
                    onTap: () => Navigator.pushNamed(
                      context,
                      '/article',
                      arguments: articlesModel[index],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ImageContainer(
                          width: double.infinity,
                          height: 180,
                          imageUrl: articlesModel[index].urlToImage ?? '',
                        ),
                        const SizedBox(height: 10.0),
                        Text(
                          articlesModel[index].title ?? '',
                          maxLines: 2,
                          textAlign: TextAlign.justify,
                          style: TypographyStyle.st3,
                        ),
                        const SizedBox(height: 10.0),
                        Align(
                          alignment: Alignment.topRight,
                          child: Text(
                            'by ${articlesModel[index].author}',
                            maxLines: 2,
                            style: TypographyStyle.overline1.grey100.w700,
                          ),
                        ),
                        const SizedBox(height: 2.0),
                        Align(
                          alignment: Alignment.topRight,
                          child: Text(
                            '${DateTime.now().difference(articlesModel[index].publishedAt!).inHours} hours ago',
                            maxLines: 2,
                            style: TypographyStyle.overline1.grey100.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
