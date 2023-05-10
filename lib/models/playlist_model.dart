import 'song_model.dart';

class Playlist {
  final String title;
  final String imageUrl;
  final List<Song> songs;

  Playlist({
    required this.title,
    required this.imageUrl,
    required this.songs,
  });

  static List<Playlist> playLists = [
    Playlist(
        title: "Hip-hop R&B Mix",
        songs: Song.songs,
        imageUrl: "assets/images/mck.jpg"),
    Playlist(
        title: "Hip-hop R&B Mix",
        songs: Song.songs,
        imageUrl: "assets/images/mck.jpg"),
    Playlist(
        title: "Hip-hop R&B Mix",
        songs: Song.songs,
        imageUrl: "assets/images/mck.jpg"),
  ];
}
