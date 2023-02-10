import 'package:flutter/material.dart';
import 'package:music_app/assets/font/font.dart';
import 'package:music_app/assets/theme/colors.dart';

import 'package:music_app/services/getSpotifyData.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

String? accessTokenSpotifyAPI = dotenv.env['TOCKEN_ACCESS_SPOTIFY_API'];

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  void initState() {
    super.initState();
    getSpotifyData(accessTokenSpotifyAPI!);
  }

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
