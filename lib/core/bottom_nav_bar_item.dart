import 'package:flutter/material.dart';

class BottomNavBarItem extends StatelessWidget {
  final String text;
  final bool Active;
  final IconData iconData;
  final Function() onTap;
  
  const BottomNavBarItem({
    super.key, 
    required this.text, 
    required this.Active, 
    required this.iconData, required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        padding:  const  EdgeInsets.symmetric(horizontal:  16, vertical: 8),
        decoration: BoxDecoration(
          color: Active ? Colors.lightBlue: null,
          borderRadius: BorderRadius.circular(40),
        ),
        child: Row( 
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
            Icon(
              iconData,
              color: Active ? Colors.white : Colors.grey,
            ),
            AnimatedContainer(
              duration: const Duration(milliseconds: 400),
              width: Active ? 8 : 0,
              height: 1,
            ),
            if(Active)
            Text(
              text,
              style: const TextStyle( color: Colors.white),
            )
          ],
        )
      ),
    );
  }
}
