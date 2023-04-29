class Song {
  final String title;
  final String description;
  final String url;
  final String coveUrl;

  Song(
      {required this.title,
      required this.description,
      required this.url,
      required this.coveUrl});

  static List<Song> songs = [
    Song(
      title: "Tại Vì Sao",
      description: "MCK",
      url: "assets/music/tai_vi_sao.mp3",
      coveUrl: "assets/images/mck.jpg",
    ),
    Song(
      title: "Là Anh",
      description: "Phạm Lịch",
      url: "assets/music/laanh.mp3",
      coveUrl: "assets/images/OIP.jpg",
    ),
    Song(
      title: "Anh đã ổn hơn",
      description: "MCK",
      url: "assets/music/better.mp3",
      coveUrl: "assets/images/mck1.jpg",
    ),
  ];
}
