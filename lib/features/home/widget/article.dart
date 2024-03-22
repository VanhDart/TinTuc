// // ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'dart:convert';

// class Article {
//   final String title;
//   final String description;
//   final String urlToImage;
//   Article({
//     required this.title,
//     required this.description,
//     required this.urlToImage,
//   });

//   Article copyWith({
//     String? title,
//     String? description,
//     String? urlToImage,
//   }) {
//     return Article(
//       title: title ?? this.title,
//       description: description ?? this.description,
//       urlToImage: urlToImage ?? this.urlToImage,
//     );
//   }

//   Map<String, dynamic> toMap() {
//     return <String, dynamic>{
//       'title': title,
//       'description': description,
//       'urlToImage': urlToImage,
//     };
//   }

//   factory Article.fromMap(Map<String, dynamic> map) {
//     return Article(
//       title: map['title'] as String,
//       description: map['description'] as String,
//       urlToImage: map['urlToImage'] as String,
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory Article.fromJson(String source) => Article.fromMap(json.decode(source) as Map<String, dynamic>);

//   @override
//   String toString() => 'Article(title: $title, description: $description, urlToImage: $urlToImage)';

//   @override
//   bool operator ==(covariant Article other) {
//     if (identical(this, other)) return true;
  
//     return 
//       other.title == title &&
//       other.description == description &&
//       other.urlToImage == urlToImage;
//   }

//   @override
//   int get hashCode => title.hashCode ^ description.hashCode ^ urlToImage.hashCode;
// }


import 'package:news_app/features/home/widget/source.dart';

class Article {
  Source source;
  String author;
  String title;
  String description;
  String url;
  String urlToImage;
  String publishedAt;
  String content;
  Article({
    required this.source,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });
  

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      source: Source.fromJson(json['source']),
      author: json['author'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      url: json['url'] as String,
      urlToImage: json['urlToImage'] as String,
      publishedAt: json['publishedAt'] as String,
      content: json['content'] as String,
    );
  }
Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'source': source.toMap(),
      'author': author,
      'title': title,
      'description': description,
      'url': url,
      'urlToImage': urlToImage,
      'publishedAt': publishedAt,
      'content': content,
    };
  }

  factory Article.fromMap(Map<String, dynamic> map) {
    return Article(
      source: Source.fromMap(map['source'] as Map<String,dynamic>),
      author: map['author'] as String,
      title: map['title'] as String,
      description: map['description'] as String,
      url: map['url'] as String,
      urlToImage: map['urlToImage'] as String,
      publishedAt: map['publishedAt'] as String,
      content: map['content'] as String,
    );
  }
}
