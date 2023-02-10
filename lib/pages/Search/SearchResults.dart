import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:music_app/assets/font/font.dart';
import 'package:music_app/assets/theme/colors.dart';
import 'package:music_app/pages/Search/models/TracksModels.dart';
import 'package:music_app/services/getSpotifyData.dart';

String? accessTokenSpotifyAPI = dotenv.env['TOCKEN_ACCESS_SPOTIFY_API'];

class SearchResultPage extends StatefulWidget {
  SearchResultPage({
    super.key,
    required this.searchQ,
  });

  String searchQ;

  @override
  State<SearchResultPage> createState() => _SearchResultPageState();
}

class _SearchResultPageState extends State<SearchResultPage> {
  String _searchQ = "";
  var tracks = <Tracks>[];

  void getTracks() {
    TracksSearch.searchDataFromSpotifyAPI(
            accessTokenSpotifyAPI!, _searchQ, "track", "FR", 3, 0)
        .then((response) {
      setState(() {
        Iterable list = json.decode(response)['tracks'];
        tracks = list.map((model) => Tracks.fromJson(model)).toList();
      });
    });
  }

  void Test() {
    TracksSearch.searchDataFromSpotifyAPI(
        accessTokenSpotifyAPI!, _searchQ, "track", "FR", 3, 0);
  }

  @override
  void initState() {
    super.initState();
    _searchQ = widget.searchQ;
    Test();
    //getTracks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: gold,
        title: Text(
          'Results SearchPage',
          style: mainTitleDark,
        ),
      ),
      body: ListView.builder(
        itemCount: tracks.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              tracks[0].title,
            ),
            subtitle: Text(tracks[0].artist),
            leading: Container(
              height: 60,
              width: 100,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(tracks[index].imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
