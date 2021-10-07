class Albumes {
  final String title;
  final String cover;
  final String artist;
  final int tracks;

  Albumes(
      {required this.title,
      required this.cover,
      required this.artist,
      required this.tracks});

  factory Albumes.fromJson(Map<String, dynamic> json) {
    return Albumes(
        title: json['title'],
        cover: json['cover'],
        tracks: json['nb_tracks'],
        artist: json['artist']['name']);
  }
}
