class Tracks {
  final String title;
  final String artist;
  final String imageUrl;
  final String trackUri;

  Tracks({
    required this.title,
    required this.artist,
    required this.imageUrl,
    required this.trackUri,
  });

  factory Tracks.fromJson(Map<String, dynamic> json) {
    return Tracks(
        title: json['tracks']['items']['name'],
        artist: json['tracks']['items']['album']['artists']['name'],
        imageUrl: json['tracks']['items']['album']['images']['url'],
        trackUri: json['tracks']['items']['album']['uri']);
  }
}
