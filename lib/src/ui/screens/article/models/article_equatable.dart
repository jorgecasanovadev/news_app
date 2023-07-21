import 'package:equatable/equatable.dart';

class Article extends Equatable {
  final String id;
  final String title;
  final String subtitle;
  final String body;
  final String author;
  final String authorImageUrl;
  final String category;
  final String imageUrl;
  final int views;
  final DateTime createdAt;

  const Article({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.body,
    required this.author,
    required this.authorImageUrl,
    required this.category,
    required this.imageUrl,
    required this.views,
    required this.createdAt,
  });

  static List<Article> articles = [
    Article(
      id: '1',
      title:
          'Noticias del dia numero 01 Noticias del dia numero 01 Noticias del dia numero 01',
      subtitle: 'Subtitulos de la noticia numero 01',
      body:
          'La noticia numero 01, consta del siguiente cantidad de informacion. La noticia numero 01, consta del siguiente cantidad de informacion La noticia numero 01, consta del siguiente cantidad de informacion La noticia numero 01, consta del siguiente cantidad de informacion',
      author: 'Anna Wright',
      authorImageUrl:
          'https://images.unsplash.com/photo-1529107386315-e1a2ed48a620?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80',
      category: 'Politics',
      imageUrl:
          'https://images.unsplash.com/photo-1529107386315-e1a2ed48a620?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80',
      views: 1204,
      createdAt: DateTime.now().subtract(const Duration(hours: 5)),
    ),
    Article(
      id: '2',
      title:
          'Noticias del dia numero 02 Noticias del dia numero 02 Noticias del dia numero 02',
      subtitle: 'Subtitulos de la noticia numero 02',
      body:
          'La noticia numero 02, consta del siguiente cantidad de informacion.',
      author: 'Anna Wright',
      authorImageUrl:
          'https://images.unsplash.com/photo-1521984692647-a41fed613ec7?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2071&q=80',
      category: 'Politics',
      imageUrl:
          'https://images.unsplash.com/photo-1521984692647-a41fed613ec7?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2071&q=80',
      views: 1204,
      createdAt: DateTime.now().subtract(const Duration(hours: 5)),
    ),
    Article(
      id: '3',
      title:
          'Noticias del dia numero 03 Noticias del dia numero 03 Noticias del dia numero 03',
      subtitle: 'Subtitulos de la noticia numero 03',
      body:
          'La noticia numero 01, consta del siguiente cantidad de informacion.',
      author: 'Anna Wright',
      authorImageUrl:
          'https://images.unsplash.com/photo-1602436294480-4e1db564adda?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=696&q=80',
      category: 'Politics',
      imageUrl:
          'https://images.unsplash.com/photo-1602436294480-4e1db564adda?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=696&q=80',
      views: 1204,
      createdAt: DateTime.now().subtract(const Duration(hours: 5)),
    ),
    Article(
      id: '4',
      title:
          'Noticias del dia numero 04 Noticias del dia numero 04 Noticias del dia numero 04',
      subtitle: 'Subtitulos de la noticia numero 04',
      body:
          'La noticia numero 01, consta del siguiente cantidad de informacion.',
      author: 'Anna Wright',
      authorImageUrl:
          'https://images.unsplash.com/photo-1554418651-70309daf95f5?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1170&q=80',
      category: 'Politics',
      imageUrl:
          'https://images.unsplash.com/photo-1554418651-70309daf95f5?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1170&q=80',
      views: 1204,
      createdAt: DateTime.now().subtract(const Duration(hours: 5)),
    ),
    Article(
      id: '5',
      title:
          'Noticias del dia numero 05 Noticias del dia numero 05 Noticias del dia numero 05',
      subtitle: 'Subtitulos de la noticia numero 05',
      body:
          'La noticia numero 01, consta del siguiente cantidad de informacion.',
      author: 'Anna Wright',
      authorImageUrl:
          'https://images.unsplash.com/photo-1541872703-74c5e44368f9?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1106&q=80',
      category: 'Politics',
      imageUrl:
          'https://images.unsplash.com/photo-1541872703-74c5e44368f9?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1106&q=80',
      views: 1204,
      createdAt: DateTime.now().subtract(const Duration(hours: 5)),
    ),
  ];

  @override
  List<Object> get props => [
        id,
        title,
        subtitle,
        body,
        author,
        authorImageUrl,
        category,
        imageUrl,
        views,
        createdAt,
      ];
}
