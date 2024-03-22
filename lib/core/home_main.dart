import 'package:flutter/material.dart';
import 'package:news_app/core/bottom_nav_bar.dart';
import 'package:news_app/features/heart/pages/heart_page.dart';
import 'package:news_app/features/home/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, 
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late final PageController _pageController;
  int _pageIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _pageIndex);
  }

  @override
  void dispose() {
    _pageController = PageController();
    super.dispose();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: PageView(
      controller:  _pageController,
      onPageChanged: (value){
        setState(() {
          _pageIndex = value;
        });
      },
      children: const [
        HomePage(),
        HeartPage(),
      ],
     ),
     bottomNavigationBar: BottomNavBar(currentIndex: _pageIndex, onTap: (value){
      _pageController.jumpToPage(value);
     },) ,
    );
  }
}
