// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:uuid/uuid.dart';

class ArticleModel {
  String? id;
  String? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? content;
  DateTime? publishedAt;

  ArticleModel({
    required this.source,
    required this.id,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.content,
    required this.publishedAt,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'source': source,
      'author': author,
      'title': title,
      'description': description,
      'url': url,
      'urlToImage': urlToImage,
      'content': content,
      'publishedAt': publishedAt?.toString(),
    };
  }

  factory ArticleModel.fromMap(Map<String, dynamic> map) {
    return ArticleModel(
      id: map['id'].runtimeType != Null ? map['id'] : generateNewsId(),
      source: map['source'].runtimeType != Null ? map['source']['name'] : '',
      author: map['author'].runtimeType != Null
          ? map['author']
          : map['source']['name'],
      title: map['title'].runtimeType != Null ? map['title'] : '',
      description:
          map['description'].runtimeType != Null ? map['description'] : '',
      url: map['url'].runtimeType != Null ? map['url'] : '',
      urlToImage:
          map['urlToImage'].runtimeType != Null ? map['urlToImage'] : '',
      content: map['content'].runtimeType != Null
          ? map['content']
          : 'Without information',
      publishedAt: map['publishedAt'] != null
          ? DateTime.parse(map['publishedAt'] as String)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ArticleModel.fromJson(String source) =>
      ArticleModel.fromMap(json.decode(source) as Map<String, dynamic>);

  static String generateNewsId() {
    const uuid = Uuid();
    var newId = uuid.v4();
    newId = newId.replaceAll('-', '');
    return newId.substring(0, 12);
  }
}
