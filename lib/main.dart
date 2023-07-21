import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:news_app/src/ui/screens/article/bloc/article_bloc.dart';
import 'package:news_app/src/ui/screens/article/models/article_model.dart';
import 'package:news_app/src/ui/screens/screens.dart';

void main() async {
  await dotenv.load(fileName: 'lib/.env');
  await EasyLocalization.ensureInitialized();

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => ArticleBloc(),
      ),
    ],
    child: EasyLocalization(
      supportedLocales: const [
        Locale('es', ''),
        Locale('en', ''),
      ],
      path: 'assets/translations',
      fallbackLocale: const Locale('es', ''),
      child: const MyApp(),
    ),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'News App',
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      onGenerateRoute: (settings) {
        final args = settings.arguments;

        switch (settings.name) {
          case '/':
            return MaterialPageRoute(builder: (_) => const HomeScreen());
          case '/discover':
            return MaterialPageRoute(builder: (_) => const DiscoverScreen());
          case '/article':
            return MaterialPageRoute(
              builder: (_) => ArticleScreen(articleModel: args as ArticleModel),
            );

          default:
            ErrorWidget.builder = (FlutterErrorDetails errorDetails) {
              return ErrorScreen(errorDetails: errorDetails);
            };
        }
        return null;
      },
    );
  }
}
