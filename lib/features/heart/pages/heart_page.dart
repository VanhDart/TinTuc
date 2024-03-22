import 'package:flutter/material.dart';
import 'package:news_app/features/home/widget/article.dart';

class HeartPage extends StatelessWidget {
  const HeartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Heart Page'),
      ),
      body: FutureBuilder<List<Article>>(
        future: loadFavorites(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator(); // Hiển thị tiến trình đang tải
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}'); // Hiển thị lỗi nếu có
          } else if (snapshot.hasData) {
            final favorites = snapshot.data!;
            return ListView.builder(
              itemCount: favorites.length,
              itemBuilder: (context, index) {
                final favorite = favorites[index];
                return ListTile(
                  title: Text(favorite.title),
                  // Hiển thị các thông tin khác của bài báo
                );
              },
            );
          } else {
            return Text('No favorites found'); // Hiển thị thông báo nếu không có dữ liệu yêu thích
          }
        },
      ),
    );
  }

Future<List<Article>> loadFavorites() async {
  return []; 
}
}
