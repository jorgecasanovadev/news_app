import 'dart:math';
import 'dart:developer' as log;

import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/src/ui/screens/article/bloc/article_bloc.dart';
import 'package:news_app/src/ui/components/custom_bottom_nav_bar.dart';
import 'package:news_app/src/ui/screens/home/views/breaking_view.dart';
import 'package:news_app/src/ui/screens/home/views/today_news_view.dart';
import 'package:news_app/src/ui/themes/themes.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const routeName = '/';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ArticleBloc articleBloc;
  late String countryValue = '';
  late String countryCode = 'us';
  final index = Random().nextInt(10);

  Map<String, String> countryMap = {
    'United States': 'us',
    'Argentina': 'ar',
    'India': 'in',
    'Colombia': 'co',
    'Canada': 'ca',
    'Venezuela': 've',
    'Brazil': 'br',
    'Czech_Republic': 'cz',
    'Belarus': 'be',
    'Russia': 'ru',
  };

  @override
  void initState() {
    articleBloc = BlocProvider.of<ArticleBloc>(context);
    articleBloc.loadNewsByCountry();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          Container(
            padding: const EdgeInsets.only(right: 15.0),
            width: 200,
            child: CSCPicker(
              showCities: false,
              showStates: false,
              countryFilter: const [
                CscCountry.United_States,
                CscCountry.Argentina,
                CscCountry.India,
                CscCountry.Colombia,
                CscCountry.Canada,
                CscCountry.Venezuela,
                CscCountry.Brazil,
                CscCountry.Czech_Republic,
                CscCountry.Belarus,
                CscCountry.Russia,
                // Add more countries here...
              ],
              dropdownDecoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                color: bluegrey150,
                border: Border.all(color: bluegrey150, width: 1),
              ),
              onCountryChanged: (value) {
                countryValue = value;
                setState(() {});
                log.log(countryValue);
              },
              countryDropdownLabel: countryValue,
            ),
          ),
        ],
      ),
      bottomNavigationBar: const CustomBottomNavBar(index: 0),
      extendBodyBehindAppBar: true,
      body: BlocBuilder<ArticleBloc, ArticleState>(
        builder: (context, state) {
          if (state.isLoadingNews) {
            return const Center(
              child: CircularProgressIndicator(
                color: blue500,
              ),
            );
          }

          if (state.hasErrorLoadingNews) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: Text(
                      'Error to load network news',
                      textAlign: TextAlign.center,
                      style: TypographyStyle.st3.bold,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    iconSize: 35.0,
                    icon: const Icon(Icons.refresh),
                  ),
                ],
              ),
            );
          }

          if (state.news.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: Text(
                      'No news found it',
                      textAlign: TextAlign.center,
                      style: TypographyStyle.st3.bold,
                    ),
                  ),
                ],
              ),
            );
          }

          return RefreshIndicator(
            onRefresh: () async => await articleBloc.loadNewsByCountry(),
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                NewOfTheDay(articlesModel: state.news[index]),
                BreakingNews(articlesModel: state.news),
              ],
            ),
          );
        },
      ),
    );
  }
}
