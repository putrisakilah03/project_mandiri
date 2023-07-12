import 'package:flutter/material.dart';
import 'package:putri_movie/ui/account.dart';
import 'package:putri_movie/ui/beranda.dart';
import 'package:putri_movie/ui/favorite.dart';

class HomePages extends StatefulWidget {
  const HomePages({super.key});

  @override
  State<HomePages> createState() => _HomePagesState();
}

class _HomePagesState extends State<HomePages> {
  late int isCurrentIndex = 0;
  final List<Widget> _pages = [
    const BerandaPages(),
    const FavoritePages(),
    const AccountPages(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'User',
          ),
        ],
        backgroundColor: Colors.black.withOpacity(0.4),
        elevation: 0,
        currentIndex: isCurrentIndex,
        selectedItemColor: Colors.pink,
        unselectedItemColor: Colors.grey,
        onTap: (value) {
          setState(() {
            isCurrentIndex = value;
          });
        },
      ),
      body: SafeArea(child: _pages[isCurrentIndex]),
    );
  }
}
