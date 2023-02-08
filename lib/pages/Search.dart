import 'package:flutter/material.dart';
import 'package:music_app/assets/font/font.dart';
import 'package:music_app/assets/theme/colors.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColorDark,
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'SearchPage',
                style: mainTitle,
              )
            ]),
      ),
    );
  }
}
