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
        title: json['album']['name'],
        artist: json['album']['artists'][0]['name'],
        imageUrl: json['album']['images'][0]['url'],
        trackUri: json['album']['uri']);
  }
}
