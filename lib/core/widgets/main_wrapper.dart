import 'package:anywhere_variant_one/core/widgets/app_background.dart';
import 'package:anywhere_variant_one/core/widgets/bottom_nav.dart';
import 'package:anywhere_variant_one/features/bookmark_feature/presentation_layer/screens/bookmark_screen.dart';
import 'package:flutter/material.dart';

import '../../features/home_feature/presentation_layer/screens/home_screen.dart';



class MainWrapper extends StatelessWidget {
   MainWrapper({super.key});
final PageController pageController=PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    var he =MediaQuery.of(context).size.height;
    List<Widget> pageViewWidget = [
      const HomeScreen(),
      const BookmarkScreen(),
    ];
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: BottomNav( Controller: pageController,),
      body:Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AppBackground.getBackgroundImage(),
            fit: BoxFit.cover
          )
        ),
        height: he,
        child: PageView(
          controller: pageController,
          children: pageViewWidget,
        ),
      ) ,
    );
  }
}


