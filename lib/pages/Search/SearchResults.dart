import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:music_app/assets/font/font.dart';
import 'package:music_app/assets/theme/colors.dart';
import 'package:music_app/pages/Search/models/TracksModels.dart';
import 'package:music_app/services/getSpotifyData.dart';

import 'package:http/http.dart' as http;

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
  late Map _response;
  late List<Tracks> tracks;

  Future _getTracks() {
    return TracksSearch.searchDataFromSpotifyAPI(
        accessTokenSpotifyAPI!, _searchQ, "track", "FR", 1, 0);
  }

  @override
  void initState() {
    super.initState();
    _searchQ = widget.searchQ;
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
      body: FutureBuilder(
        future: TracksSearch.searchDataFromSpotifyAPI(
          accessTokenSpotifyAPI!,
          widget.searchQ,
          "track",
          "FR",
          3,
          0,
        ),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            Map<String, dynamic> jsonMap = json.decode(snapshot.data.body);
            List allItems = jsonMap['tracks']['items'];
            final allTracks = allItems.map((e) => Tracks.fromJson(e)).toList();

            return ListView.builder(
              itemCount: allTracks.length,
              itemBuilder: (context, index) {
                return Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: Colors.black),
                    ),
                  ),
                  child: ListTile(
                    title: Text(
                      allTracks[index].title,
                    ),
                    subtitle: Text(allTracks[index].artist),
                    leading: Container(
                      height: 60,
                      width: 100,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(allTracks[index].imageUrl),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
