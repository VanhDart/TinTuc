import 'package:flutter/material.dart';
import 'package:news_app/features/home/widget/article.dart';
import 'package:localstore/localstore.dart';

class DetailedPage extends StatefulWidget {
  final Article article;
  
  DetailedPage({required this.article});

  @override
  _DetailedPageState createState() => _DetailedPageState();
}

class _DetailedPageState extends State<DetailedPage> {
  bool isFavorite = false; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
        centerTitle: true, 
        actions: [
          IconButton(
            icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_border),
            onPressed: () {
              setState(() {
                isFavorite = !isFavorite; 
                widget.article.save(); // Lưu trạng thái yêu thích vào localstore
              });
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200.0,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(widget.article.urlToImage),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(12.0),
              ),
            ),
            const Text(
              '#Prolitics',
              style: const TextStyle(color: Colors.grey),
            ),
            const SizedBox(
              height: 8.0,
            ),
            Text(
              widget.article.title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
            const SizedBox(
              height: 8.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.article.source.name,
                  style: const TextStyle(color: Colors.grey),
                ),
                Text(
                  widget.article.publishedAt,
                  style: const TextStyle(color: Colors.grey),
                ),
              ]
            ),
            const SizedBox(
              height: 16.0,
            ),
            Text(
              widget.article.description,
              style: const TextStyle(
                fontSize: 16.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

extension ArticleExtension on Article {
  Future<void> save() async {
    final db = Localstore.instance;
    return db.collection('articles').doc(source.id).set(toMap()); // Lưu thông tin bài báo với id từ Source
  }
}
