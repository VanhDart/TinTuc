import 'package:flutter/material.dart';

class HomeHead extends StatelessWidget {
  final String title;
  final String title2;
  const HomeHead({super.key, required this.title, required this.title2});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(color: Colors.grey ),
          ),
          Text(
            title2,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 20,
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0,25,0,0),
            child: TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[200], // Đặt màu nền xám
                hintText: 'Search',
                prefixIcon: const Icon(
                  Icons.search,
                  size: 20, // Đặt kích thước của biểu tượng
                  color: Colors.grey, // Đặt màu của biểu tượng
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                enabledBorder: OutlineInputBorder(
                  // Đặt đường viền khi không hoạt động
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                isDense: true,                      // Added this
                contentPadding: EdgeInsets.all(8), 
              ),
            ),
          ),

          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                
                Container(
                  padding: const EdgeInsets.fromLTRB(25,8,25,8),
                  margin: EdgeInsets.fromLTRB(0,20,10,20),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(15.0),
                    border: Border.all(
                      color: Colors.black, // Màu sắc của viền
                      width: 1, // Độ dày của viền
                    ),
                  ),
                  child: const Text(
                    'All',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(25,8,25,8),
                  margin: EdgeInsets.fromLTRB(0,20,10,20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15.0),
                    border: Border.all(
                      color: Colors.black, // Màu sắc của viền
                      width: 1, // Độ dày của viền
                    ),
                  ),
                  child: const Text(
                    'Politics',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(25,8,25,8),
                  margin: EdgeInsets.fromLTRB(0,20,10,20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15.0),
                    border: Border.all(
                      color: Colors.black, // Màu sắc của viền
                      width: 1, // Độ dày của viền
                    ),
                  ),
                  child: const Text(
                    'Sports',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(25,8,25,8),
                  margin: EdgeInsets.fromLTRB(0,20,10,20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15.0),
                    border: Border.all(
                      color: Colors.black, // Màu sắc của viền
                      width: 1, // Độ dày của viền
                    ),
                  ),
                  child: const Text(
                    'Health',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(25,8,25,8),
                  margin: EdgeInsets.fromLTRB(0,20,10,20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15.0),
                    border: Border.all(
                      color: Colors.black, // Màu sắc của viền
                      width: 1, // Độ dày của viền
                    ),
                  ),
                  child: const Text(
                    'New',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
