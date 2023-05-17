//  Widget customListCard() {
//     return ListView.builder(
//       padding: EdgeInsets.zero,
//       itemBuilder: (context, index) {
//         return InkWell(
//           onTap: () {
//             Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => SongScreen(response: musicList[index]),
//                 ));
//           },
//           child: Row(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.only(left: 8),
//                 child: Padding(
//                   padding: const EdgeInsets.only(
//                       left: 8, bottom: 8, right: 8, top: 4),
//                   child: SizedBox(
//                     child: FadeInImage.assetNetwork(
//                         height: 60,
//                         width: 60,
//                         placeholder: "assets/images/mck.jpg",
//                         image: musicList[index].image.toString(),
//                         fit: BoxFit.fill),
//                   ),
//                 ),
//               ),
//               Flexible(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       musicList[index].title.toString(),
//                       style: const TextStyle(color: Colors.white, fontSize: 18),
//                     ),
//                     const SizedBox(
//                       height: 8,
//                     ),
//                     Text(
//                       musicList[index].artist.toString(),
//                       style: const TextStyle(color: Colors.grey, fontSize: 12),
//                     ),
//                   ],
//                 ),
//               )
//             ],
//           ),
//         );
//       },
//       itemCount: musicList.length,
//     );
//   }
// }