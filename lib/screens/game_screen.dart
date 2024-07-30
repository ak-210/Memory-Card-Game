import 'package:flutter/material.dart';
import 'package:riverpod_demo/components/game_board.dart';
import 'package:riverpod_demo/components/score_board.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        ScoreBoard(),
        Expanded(
          child: Center(
            child: GameBoard(),
          ),
        ),
      ],
    );
  }
}
