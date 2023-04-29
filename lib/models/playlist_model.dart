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
        imageUrl:
            "https://scontent.fhan2-5.fna.fbcdn.net/v/t39.30808-6/343059061_228951426485808_1116448589344633692_n.jpg?stp=cp6_dst-jpg&_nc_cat=106&ccb=1-7&_nc_sid=8bfeb9&_nc_ohc=D_Qb0L5ZJeEAX8FHpDm&_nc_ht=scontent.fhan2-5.fna&oh=00_AfC-PwDX7ccQgAVy5GulFlt7f55JWLGXsiD3IPZ8HkB7Ag&oe=644E12A3"),
    Playlist(
        title: "Hip-hop R&B Mix",
        songs: Song.songs,
        imageUrl:
            "https://scontent.fhan2-5.fna.fbcdn.net/v/t39.30808-6/343059061_228951426485808_1116448589344633692_n.jpg?stp=cp6_dst-jpg&_nc_cat=106&ccb=1-7&_nc_sid=8bfeb9&_nc_ohc=D_Qb0L5ZJeEAX8FHpDm&_nc_ht=scontent.fhan2-5.fna&oh=00_AfC-PwDX7ccQgAVy5GulFlt7f55JWLGXsiD3IPZ8HkB7Ag&oe=644E12A3"),
    Playlist(
        title: "Hip-hop R&B Mix",
        songs: Song.songs,
        imageUrl:
            "https://scontent.fhan2-5.fna.fbcdn.net/v/t39.30808-6/343059061_228951426485808_1116448589344633692_n.jpg?stp=cp6_dst-jpg&_nc_cat=106&ccb=1-7&_nc_sid=8bfeb9&_nc_ohc=D_Qb0L5ZJeEAX8FHpDm&_nc_ht=scontent.fhan2-5.fna&oh=00_AfC-PwDX7ccQgAVy5GulFlt7f55JWLGXsiD3IPZ8HkB7Ag&oe=644E12A3"),
  ];
}
