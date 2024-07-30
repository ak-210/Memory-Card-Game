import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_demo/providers/no_of_cards_provider.dart';
import 'package:riverpod_demo/providers/player_provider.dart';
import 'package:riverpod_demo/providers/turn_provider.dart';

class ScoreBoard extends StatelessWidget {
  const ScoreBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        final pla = ref.watch(turnNotifierProvider);
        final players = ref.read(playersProvider);
        final completed = ref.watch(discardedNoProvider) == ref.read(noOfCardsProvider);

        return GridView.count(
          crossAxisCount: players.length,
          crossAxisSpacing: 20,
          childAspectRatio: 4 / players.length,
          shrinkWrap: true,
          padding: const EdgeInsets.all(20),
          children: List.generate(
            players.length,
            (index) => Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(width: 2.5),
              ),
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: players[index].playerColor,
                  border: Border.all(
                    color: completed || pla != players[index] ? Colors.transparent : Colors.amber,
                    width: 10,
                  ),
                ),
                child: Center(
                  child: Text(
                    players[index].points.toString(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
