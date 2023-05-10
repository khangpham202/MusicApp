import 'package:flutter/material.dart';
import 'package:music_app/widgets/widgets.dart';

import '../models/playlist_model.dart';
import '../models/song_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Song> songs = Song.songs;
    List<Playlist> playlists = Playlist.playLists;
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
            Colors.deepPurple.shade800.withOpacity(0.8),
            Colors.deepPurple.shade200.withOpacity(0.8)
          ])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: const _CustomAppBar(),
        bottomNavigationBar: const CustomNavBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const _DiscoverMusic(),
              _TrendingMusic(songs: songs),
              _PlayListMusic(playlists: playlists)
            ],
          ),
        ),
      ),
    );
  }
}

class _PlayListMusic extends StatelessWidget {
  const _PlayListMusic({
    Key? key,
    required this.playlists,
  }) : super(key: key);

  final List<Playlist> playlists;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          const SectionHeader(title: "Playlists"),
          ListView.builder(
              shrinkWrap: true,
              padding: const EdgeInsets.only(top: 20),
              physics: const NeverScrollableScrollPhysics(),
              itemCount: playlists.length,
              itemBuilder: ((context, index) {
                return PlayListCard(playlist: playlists[index]);
              }))
        ],
      ),
    );
  }
}

class _TrendingMusic extends StatelessWidget {
  const _TrendingMusic({
    Key? key,
    required this.songs,
  }) : super(key: key);

  final List<Song> songs;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const SectionHeader(title: "Trending Music"),
          const SizedBox(height: 20),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.27,
            child: ListView.builder(
                itemCount: songs.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: ((context, index) {
                  return SongCard(song: songs[index]);
                })),
          )
        ],
      ),
    );
  }
}

class _DiscoverMusic extends StatelessWidget {
  const _DiscoverMusic({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Welcome",
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: Colors.white),
            ),
            const SizedBox(height: 5),
            Text(
              "Enjoy your favorite music",
              style: Theme.of(context)
                  .textTheme
                  .headline6!
                  .copyWith(fontWeight: FontWeight.bold, color: Colors.white),
            ),
            const SizedBox(height: 20),
            TextFormField(
              decoration: InputDecoration(
                  isDense: true,
                  filled: true,
                  fillColor: Colors.white,
                  hintText: "Search ...",
                  hintStyle: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: Colors.grey.shade400),
                  prefixIcon: Icon(Icons.search, color: Colors.grey.shade400),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none)),
            )
          ],
        ));
  }
}

// class _CustomNavBar extends StatefulWidget {
//   const _CustomNavBar({
//     Key? key,
//   }) : super(key: key);

//   @override
//   State<_CustomNavBar> createState() => _CustomNavBarState();
// }

// class _CustomNavBarState extends State<_CustomNavBar> {
//   int _selectedIndex = 0;

//   final List<Widget> _screens = [
//     const HomeScreen(),
//     const FavoriteScreen(),
//     const PlayScreen(),
//     const ProfileScreen()
//   ];
//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//       Navigator.push(
//           context, MaterialPageRoute(builder: (context) => _screens[index]));
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BottomNavigationBar(
//         type: BottomNavigationBarType.fixed,
//         backgroundColor: Colors.deepPurple.shade800,
//         unselectedItemColor: Colors.white,
//         selectedItemColor: Colors.white,
//         showUnselectedLabels: false,
//         showSelectedLabels: false,
//         currentIndex: _selectedIndex,
//         onTap: _onItemTapped,
//         items: const [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: "Home",
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.favorite_border_outlined),
//             label: "Favotires",
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.play_circle_outlined),
//             label: "Play",
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.people_alt_outlined),
//             label: "Profile",
//           ),
//         ]);
//   }
// }

class _CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  const _CustomAppBar();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: const Icon(Icons.grid_view_rounded),
      actions: [
        Container(
          margin: const EdgeInsets.only(right: 20),
          child: const CircleAvatar(
            backgroundImage: NetworkImage(
                "https://images.unsplash.com/photo-1581088547417-790ffe02b79d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwzfHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=1000&q=60"),
          ),
        )
      ],
      title: const Text("Music App"),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize {
    return const Size.fromHeight(40.0);
  }
}
