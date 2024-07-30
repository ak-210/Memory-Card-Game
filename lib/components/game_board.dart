import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:riverpod_demo/components/card_tile.dart';
import 'package:riverpod_demo/components/card_tile_v2.dart';
import 'package:riverpod_demo/models/player_model.dart';
import 'package:riverpod_demo/providers/card_provider.dart';
import 'package:riverpod_demo/providers/difficulty_provider.dart';
import 'package:riverpod_demo/providers/no_of_cards_provider.dart';
import 'package:riverpod_demo/providers/player_provider.dart';

class GameBoard extends ConsumerWidget {
  const GameBoard({super.key});

  List<PlayerModel> _findWinner(players) {
    List<PlayerModel> winners = [];
    for (PlayerModel player in players) {
      if (winners.isEmpty) {
        winners.add(player);
      } else if (winners[0].points < player.points) {
        winners = [player];
      } else if (winners[0].points == player.points) {
        winners.add(player);
      }
    }
    return winners;
  }

  int axisCount(WidgetRef ref) {
    final diff = ref.watch(difficultyProvider);
    switch (diff) {
      case (Difficulty.EASY):
        return 3;
      case (Difficulty.MEDIUM):
        return 4;
      case (Difficulty.HARD):
        return 5;
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cards = ref.read(cardProvider);
    final int num = cards.length;
    final completed = ref.watch(discardedNoProvider) == num;
    List<PlayerModel> winners = [];

    if (completed) winners = _findWinner(ref.read(playersProvider));

    return !completed
        ? GridView.count(
            crossAxisCount: axisCount(ref),
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            padding: const EdgeInsets.all(20),
            shrinkWrap: true,
            children: List.generate(
              num,
              (index) => CardTileV2(cards[index]),
            ),
          )
        : Stack(
            alignment: Alignment.center,
            children: [
              GridView.count(
                crossAxisCount: winners.length,
                childAspectRatio: 2 / winners.length,
                shrinkWrap: true,
                children: List.generate(
                  winners.length,
                  (index) => Container(
                    color: winners[index].playerColor,
                  ),
                ),
              ),
              Text(
                winners.length == 1 ? '${winners[0].name} Wins' : 'Draw',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                ),
              )
            ],
          );
  }
}
