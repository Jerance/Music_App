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
  final _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    searchDataFromSpotifyAPI(
        accessTokenSpotifyAPI!, "DIE", "track", "FR", 3, 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColorDark,
      body: Center(
        child: Column(children: <Widget>[
          const SizedBox(
            height: 75,
          ),
          Text(
            'Search your Music',
            style: mainTitle,
          ),
          const SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 400,
                height: 60,
                alignment: Alignment.center,
                child: Row(children: const [
                  Expanded(
                    child: TextField(
                        style: TextStyle(color: mainColorLight),
                        decoration: InputDecoration(
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(
                              width: 0,
                              style: BorderStyle.none,
                            ),
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(10),
                              topLeft: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                            ),
                          ),
                          filled: true,
                          fillColor: inputBg,
                          suffixIcon: IconButton(
                              icon: Icon(
                                Icons.search,
                                color: gold,
                              ),
                              onPressed: null),
                          hintStyle: TextStyle(color: lightGray, fontSize: 16),
                        )),
                  ),
                ]),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
