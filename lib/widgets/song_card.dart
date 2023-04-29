import 'package:flutter/material.dart';

import '../models/song_model.dart';

class SongCard extends StatelessWidget {
  const SongCard({
    Key? key,
    required this.song,
  }) : super(key: key);

  final Song song;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed("/song", arguments: song);
      },
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        child: Stack(alignment: Alignment.bottomCenter, children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.45,
            decoration: BoxDecoration(
                // borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    image: AssetImage(song.coveUrl), fit: BoxFit.cover)),
          ),
          Container(
            height: 50,
            width: MediaQuery.of(context).size.width * 0.37,
            margin: const EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white.withOpacity(0.8)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(song.title,
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: Colors.deepPurple,
                            fontWeight: FontWeight.bold)),
                    Text(song.description,
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: Colors.blueGrey,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
                const Icon(
                  Icons.play_circle,
                  color: Colors.deepPurple,
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
