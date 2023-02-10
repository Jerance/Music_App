import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<void> getSpotifyData(String accessToken) async {
  final response = await http.get(
    Uri.parse('https://api.spotify.com/v1/tracks/11dFghVXANMlKmJXsNCbNl'),
    headers: {
      'Authorization': 'Authorization: Bearer $accessToken',
      'Content-Type': 'application/json',
      'Host': 'api.spotify.com'
    },
  );

  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    debugPrint(data.toString());
  } else if (response.statusCode == 400) {
    debugPrint("error404:");
  }
}

class TracksSearch {
  static Future searchDataFromSpotifyAPI(String accessToken, String q,
      String type, String market, int limit, int offset) async {
    final response = await http.get(
      Uri.parse(
          'https://api.spotify.com/v1/search?q=$q&type=$type&market=$market&limit=$limit&offset=$offset'),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Authorization: Bearer $accessToken',
        'Content-Type': 'application/json',
        'Host': 'api.spotify.com'
      },
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      debugPrint(data.toString());
    } else if (response.statusCode == 400) {
      debugPrint("error400");
    } else if (response.statusCode == 404) {
      debugPrint("error401: AccessToken de l'API de Spotify a expiré");
    }
  }
}
