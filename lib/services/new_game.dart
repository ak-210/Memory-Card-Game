import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_demo/providers/player_provider.dart';
import 'package:riverpod_demo/screens/game_screen.dart';

void newGame(int numPlayers, WidgetRef ref, BuildContext context) {
  ref.read(numOfPlayerProvider.notifier).state = numPlayers;
  Navigator.push(context, MaterialPageRoute(
    builder: (context) {
      return const GameScreen();
    },
  ));
}
