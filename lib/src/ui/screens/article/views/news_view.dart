import 'package:flutter/material.dart';
import 'package:news_app/src/ui/components/custom_tag_bar.dart';
import 'package:news_app/src/ui/screens/article/models/article_model.dart';
import 'package:news_app/src/ui/themes/themes.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsBody extends StatelessWidget {
  const NewsBody({super.key, required this.articleModel});

  final ArticleModel articleModel;

  Future<void> _launchInBrowser(String url) async {
    final int index = url.indexOf('.com');
    String authority = url.substring(8, index + 4);
    String unencodedPath = url.substring(index + 4, url.length);

    final Uri uri = Uri.https(authority, unencodedPath);
    if (!await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
        color: Colors.white,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              CustomTagBar(
                backgroundColor: black,
                children: [
                  CircleAvatar(
                    radius: 10.0,
                    backgroundImage: NetworkImage(articleModel.urlToImage!),
                  ),
                  const SizedBox(width: 10.0),
                  Text(
                    articleModel.author!,
                    maxLines: 1,
                    style: TypographyStyle.st2.white,
                  ),
                ],
              ),
              CustomTagBar(
                backgroundColor: Colors.grey.shade200,
                children: [
                  Icon(
                    Icons.timer,
                    color: bluegrey150,
                  ),
                  const SizedBox(width: 5.0),
                  Text(
                    '${DateTime.now().difference(articleModel.publishedAt!).inHours}h',
                    style: TypographyStyle.b1,
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20.0),
          Text(
            articleModel.title!,
            textAlign: TextAlign.justify,
            style: TypographyStyle.h5.w800,
          ),
          const SizedBox(height: 15.0),
          Text(
            articleModel.content!,
            textAlign: TextAlign.justify,
            softWrap: true,
            style: TypographyStyle.st165.w400,
          ),
          const SizedBox(height: 20.0),
          InkWell(
            onTap: () => _launchInBrowser(articleModel.url!),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Icon(
                  Icons.arrow_forward_outlined,
                  color: darkBlueGrey,
                ),
                Text(
                  'Learn more',
                  style: TypographyStyle.st165.darkBlueGrey,
                ),
              ],
            ),
          ),
          const SizedBox(height: 80.0),
        ],
      ),
    );
  }
}
