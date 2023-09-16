import 'package:flutter/material.dart';

class BottomNav extends StatelessWidget {
  PageController Controller;
   BottomNav({required this.Controller,super.key });

  @override
  Widget build(BuildContext context) {
    var primaryColor = Theme.of(context).primaryColor;
    TextTheme textTheme = Theme.of(context).textTheme;
    return  BottomAppBar(
shape: const CircularNotchedRectangle(),
      notchMargin: 5,
      color: primaryColor,
      child: SizedBox(
        height: 63,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(onPressed: (){
              Controller.animateToPage(0, duration: Duration(microseconds: 300), curve: Curves.bounceIn);
            }, icon: const Icon(Icons.home,color: Colors.white,)),
            IconButton(onPressed: (){
              Controller.animateToPage(1, duration: Duration(microseconds: 300), curve: Curves.bounceIn);
            }, icon: const Icon(Icons.bookmark,color: Colors.white,))
          ],
        ),
      ),
    );
  }
}
