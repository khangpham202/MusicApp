// import 'package:flutter/material.dart';

// import '../models/playlist_model.dart';

// class PlayListCard extends StatelessWidget {
//   const PlayListCard({
//     Key? key,
//     required this.playlist,
//   }) : super(key: key);

//   final playList playlist;

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () {
//         Navigator.of(context).pushNamed("/playlist", arguments: playlist);
//       },
//       child: Container(
//           height: 75,
//           margin: const EdgeInsets.only(bottom: 10),
//           padding: const EdgeInsets.symmetric(horizontal: 20),
//           decoration: BoxDecoration(
//               color: Colors.deepPurple.shade800.withOpacity(0.6),
//               borderRadius: BorderRadius.circular(15)),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: [
//               ClipRRect(
//                 borderRadius: BorderRadius.circular(15),
//                 child: Container(
//                   decoration: BoxDecoration(
//                       image: DecorationImage(
//                           image: AssetImage(playlist.imageUrl),
//                           fit: BoxFit.cover)),
//                 ),

//                 //   height: 50,
//                 //   width: 50,
//                 //   fit: BoxFit.cover,
//                 // Image.network(
//                 //   playlist.imageUrl,
//                 // ),
//               ),
//               const SizedBox(
//                 width: 20,
//               ),
//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text(
//                       playlist.title,
//                       style: Theme.of(context).textTheme.bodyLarge!.copyWith(
//                           fontWeight: FontWeight.bold, color: Colors.white),
//                     ),
//                     Text("${playlist.songs.length} songs",
//                         maxLines: 2,
//                         style: Theme.of(context).textTheme.bodySmall)
//                   ],
//                 ),
//               ),
//               IconButton(
//                   onPressed: () {},
//                   icon: const Icon(Icons.play_circle, color: Colors.white))
//             ],
//           )),
//     );
//   }
// }
