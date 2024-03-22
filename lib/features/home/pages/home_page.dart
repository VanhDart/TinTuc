import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:news_app/features/home/widget/article.dart';
import 'package:news_app/features/home/widget/home_content.dart';
import 'package:news_app/features/home/widget/home_head.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatelessWidget {
  const HomePage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const HomeHead(
              title: 'Mon, 5th September 2022',
              title2: 'Explore',
            ),
            FutureBuilder<List<Article>>(
              future: getDataApi(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text('Error: ${snapshot.error}'),
                  );
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(
                    child: Text('No data available'),
                  );
                } else {
                  final List<Article> listArticle = snapshot.data!;
                  return Expanded(
                    child: ListView.builder(
                      itemCount: listArticle.length,
                      itemBuilder: (context, index) => 
                        HomeContent(listArticle[index], context)
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

Future<List<Article>> getDataApi() async {
  try {
    final url = Uri.parse(
        'https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=2e28eb382ac94306a9828351cc14f295');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final body = response.body;
      final decodedData = json.decode(body);
      final List<Article> listArticle = [];

      for (final item in decodedData['articles']) {
        final article = Article.fromJson(item);
        listArticle.add(article);
      }
      return listArticle;
    } else {
      throw Exception(
          'Failed to load data from API. Status code: ${response.statusCode}');
    }
  } catch (e) {
    throw Exception('Failed to load data from API: $e');
  }
}
