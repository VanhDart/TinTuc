import 'package:news_app/features/home/widget/article.dart';
import 'package:flutter/material.dart';
import 'package:news_app/features/home/widget/detailed_page.dart';

// ignore: non_constant_identifier_names
Widget HomeContent(Article article, BuildContext context) {
  return InkWell(
    onTap: (){
      Navigator.push(
        context, 
        MaterialPageRoute(builder: (context) => DetailedPage(article: article))
        );
    },
    child: Container(
      margin: const EdgeInsets.all(12.0),
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18.0),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 3.0,
            )
          ]),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(
               article.urlToImage,
                width: 100, height: 100, 
                fit: BoxFit.cover),
          ),
          const SizedBox(
            width: 8.0,
          ),
          Expanded(
            child:Column(
              crossAxisAlignment: CrossAxisAlignment.start, 
              children: [
                Text(
                  article.title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14.0,
                  ),
                ),
                const SizedBox(
                  height: 8.0,
                ),
                Text(
                  article.source.name,
                  style: const TextStyle(
                    color: Colors.grey
                  ),
                ),
                const Row(
                  mainAxisAlignment:MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '3 hours ago',
                      style: TextStyle(
                    color: Colors.grey
                  ),
                    ),
    
                    Text(
                      'Politic',
                      style: TextStyle(
                    color: Colors.grey
                  ),
                    ),
                    Text(
                      '6 mins',
                      style: TextStyle(
                    color: Colors.grey
                  ),
                    )
                  ],
                )
              ] 
            ),
          )
        ],
      ),
    ),
  );
}
