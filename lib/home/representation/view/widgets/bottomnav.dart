import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:ecommerce_app/home/representation/view/home.dart';
import 'package:ecommerce_app/profile/presentation/view/profile.dart';
import 'package:ecommerce_app/store/presentation/view/strore.dart';
import 'package:flutter/material.dart';

import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:ecommerce_app/home/representation/view/home.dart';
import 'package:flutter/material.dart';

class FixedBottomNavExample extends StatefulWidget {
  @override
  _FixedBottomNavExampleState createState() => _FixedBottomNavExampleState();
}

class _FixedBottomNavExampleState extends State<FixedBottomNavExample> {
  int _currentIndex = 0;
  final PageController _pageController = PageController();

  final List<Widget> _pages = [
    Home(),
    Store(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        children: _pages,
      ),
      bottomNavigationBar: ConvexAppBar(
        items: const [
          TabItem(icon: Icons.home, title: 'Home'),
          TabItem(icon: Icons.store, title: 'Store'),
          TabItem(icon: Icons.person, title: 'Profile'),
        ],
        initialActiveIndex: _currentIndex,
        onTap: (int index) {
          _pageController.jumpToPage(index);
          setState(() {
            _currentIndex = index;
          });
        },
        backgroundColor: Colors.transparent,
        gradient: LinearGradient(
          colors: [
            Color(0xFF5C6BC0),
            Color(0xFF64B5F6),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        height: 50.0,
        activeColor: Colors.white,
        style: TabStyle.fixed,
      ),
    );
  }
}
