import 'package:flutter/material.dart';
import 'package:news_app/core/bottom_nav_bar_item.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int value) onTap;
  const BottomNavBar({
    super.key, 
    required this.currentIndex, 
    required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        BottomNavBarItem(
          text: 'home', 
          iconData: Icons.home, 
          Active: currentIndex == 0, 
          onTap: () {
            onTap(0);
          },
        ),
        BottomNavBarItem(
          text: 'Favourite', 
          iconData: Icons.favorite, 
          Active: currentIndex == 1, 
          onTap: () {
            onTap(1);
          },
        ),
        ],
      )
    );
  }
}