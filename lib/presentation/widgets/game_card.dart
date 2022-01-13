import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gamesdb/models/game.dart';

class GameCard extends StatelessWidget {
  final Game game;

  const GameCard({Key? key, required this.game}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Stack(
        alignment: AlignmentDirectional.bottomStart,
        children: [
          CachedNetworkImage(
            imageUrl: game.image as String,
            progressIndicatorBuilder: (context, url, downloadProgress) =>
                CircularProgressIndicator(value: downloadProgress.progress),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
          //TODO make all images the same size
          // Image.network(game.image as String),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(
              game.name as String,
              style: const TextStyle(color: Colors.white, fontSize: 20),
            ),
            Text(
              game.metaCritic.toString(),
              style: const TextStyle(color: Colors.white, fontSize: 20),
            ),
          ]),
        ],
      ),
    );
  }
}

// gta info https://api.rawg.io/api/games/3498?key=62519617703e483c90f5644940f2eb99