import 'package:firebase_login_page/widgets/custom_app_bar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TabBarController extends StatefulWidget {
  const TabBarController({super.key});

  @override
  State<TabBarController> createState() => _TabBarControllerState();
}

class _TabBarControllerState extends State<TabBarController> {
  int _currentState = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Social Media"),
      bottomNavigationBar: customBottomNavigationBar(),
    );
  }

  BottomNavigationBar customBottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: _currentState,
      onTap: (value) {
        setState(() {
          _currentState = value;
        });
      },
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.purple,
      items: [
        _customBottomNavigationBarItem(Icons.home, "Anasayfa"),
        _customBottomNavigationBarItem(Icons.search, "Arama"),
        _customBottomNavigationBarItem(Icons.video_library_rounded, "Reels"),
        _customBottomNavigationBarItem(Icons.shopping_bag, "Alisveris"),
        _customBottomNavigationBarItem(Icons.person, "Profil"),
      ],
    );
  }

  BottomNavigationBarItem _customBottomNavigationBarItem(
      IconData iconData, String label) {
    return BottomNavigationBarItem(icon: Icon(iconData), label: label);
  }
}
