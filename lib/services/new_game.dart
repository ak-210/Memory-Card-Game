import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:memory_card_game/providers/player_provider.dart';
import 'package:memory_card_game/screens/game_screen.dart';
import 'package:memory_card_game/services/get_size.dart';

void newGame(int numPlayers, WidgetRef ref, BuildContext context) {
  ref.read(numOfPlayerProvider.notifier).state = numPlayers;
  getSizes(ref);
  Navigator.push(context, MaterialPageRoute(
    builder: (context) {
      return const GameScreen();
    },
  ));
}
