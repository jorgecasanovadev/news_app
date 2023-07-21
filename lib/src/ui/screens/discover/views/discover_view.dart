import 'package:flutter/material.dart';
import 'package:news_app/src/ui/themes/theme.dart';

class DiscoverNews extends StatelessWidget {
  const DiscoverNews({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.15,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Discover',
            style: TypographyStyle.h3,
          ),
          const SizedBox(height: 5.0),
          Text(
            'News from all over the world',
            style: TypographyStyle.st165.w500,
          ),
          // const SizedBox(height: 20.0),
          // TextFormField(
          //   decoration: InputDecoration(
          //     hintText: 'Search',
          //     fillColor: Colors.grey.shade200,
          //     filled: true,
          //     prefixIcon: const Icon(
          //       Icons.search,
          //       color: Colors.blueGrey,
          //     ),
          //     suffixIcon: const RotatedBox(
          //       quarterTurns: 1,
          //       child: Icon(
          //         Icons.tune,
          //         color: Colors.blueGrey,
          //       ),
          //     ),
          //     border: OutlineInputBorder(
          //       borderRadius: BorderRadius.circular(20.0),
          //       borderSide: BorderSide.none,
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
