import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:music_app/assets/theme/colors.dart';
import 'package:music_app/pages/Library.dart';
import 'package:music_app/pages/Profile.dart';
import 'package:music_app/pages/Search.dart';
import 'package:music_app/pages/Social.dart';
import 'package:music_app/pages/Trend.dart';

class AppLayoutPage extends StatefulWidget {
  @override
  _AppLayoutPageState createState() => _AppLayoutPageState();
}

class _AppLayoutPageState extends State<AppLayoutPage> {
  int _selectedPage = 0;

  final _pageOptions = [
    const TrendPage(),
    const SearchPage(),
    const LibraryPage(),
    const SocialPage(),
    const ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pageOptions[_selectedPage],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: goldPaperLight,
        selectedItemColor: gold,
        currentIndex: _selectedPage,
        onTap: (int index) {
          setState(() {
            _selectedPage = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset("lib/assets/img/icons/ranking-star.svg",
                height: 25),
            label: 'Trend',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset("lib/assets/img/icons/search-solid.svg",
                height: 25),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset("lib/assets/img/icons/playlist-solid.svg",
                height: 25),
            label: 'Library',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset("lib/assets/img/icons/globe-solid.svg",
                height: 25),
            label: 'Social',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset("lib/assets/img/icons/user-solid.svg",
                height: 25),
            label: 'Profile',
          ),
        ],
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}
