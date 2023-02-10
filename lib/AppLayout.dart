import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:music_app/assets/font/font.dart';
import 'package:music_app/assets/theme/colors.dart';
import 'package:music_app/pages/Library.dart';
import 'package:music_app/pages/Profile.dart';
import 'package:music_app/pages/Search/Search.dart';
import 'package:music_app/pages/Social/Social.dart';
import 'package:music_app/pages/Trend.dart';

class AppLayoutPage extends StatefulWidget {
  @override
  _AppLayoutPageState createState() => _AppLayoutPageState();
}

class _AppLayoutPageState extends State<AppLayoutPage> {
  User? user = FirebaseAuth.instance.currentUser;

  String userPseudo = "";
  String userPhotoUrl = "";

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    final DocumentReference document =
        FirebaseFirestore.instance.collection("Users").doc(user?.uid);
    await document.get().then((snapshot) {
      if (snapshot.exists) {
        setState(() {
          var data = snapshot.data() as Map;
          userPseudo = data['pseudo'];
          userPhotoUrl = data['profilephotourl'];
        });
      } else {
        print("Aucun document trouvé");
      }
    });
  }

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
      bottomNavigationBar: Container(
        color: const Color(0xFF1A1A1A),
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: BottomNavigationBar(
          backgroundColor: const Color(0xFF1A1A1A),
          type: BottomNavigationBarType.fixed,
          unselectedItemColor: goldPaperLight,
          selectedItemColor: gold,
          unselectedLabelStyle: navbarItems,
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
                activeIcon: SvgPicture.asset(
                  "lib/assets/img/icons/ranking-star.svg",
                  height: 25,
                  color: gold,
                ),
                label: 'Trend'),
            BottomNavigationBarItem(
              icon: SvgPicture.asset("lib/assets/img/icons/search-solid.svg",
                  height: 25),
              activeIcon: SvgPicture.asset(
                "lib/assets/img/icons/search-solid.svg",
                height: 25,
                color: gold,
              ),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset("lib/assets/img/icons/library-solid.svg",
                  height: 25),
              activeIcon: SvgPicture.asset(
                "lib/assets/img/icons/library-solid.svg",
                height: 25,
                color: gold,
              ),
              label: 'Library',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset("lib/assets/img/icons/globe-solid.svg",
                  height: 25),
              activeIcon: SvgPicture.asset(
                  "lib/assets/img/icons/globe-solid.svg",
                  height: 25,
                  color: gold),
              label: 'Social',
            ),
            BottomNavigationBarItem(
              icon: userPhotoUrl == ""
                  ? const Text("")
                  : Container(
                      height: 25,
                      width: 25,
                      child: CircleAvatar(
                          foregroundColor: gold,
                          backgroundColor: gold,
                          backgroundImage: NetworkImage(userPhotoUrl)),
                    ),
              label: 'Profile',
            ),
          ],
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
