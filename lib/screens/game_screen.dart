import 'package:flutter/material.dart';
import 'package:riverpod_demo/components/game_board.dart';
import 'package:riverpod_demo/components/score_board.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.cyan[700]!, Colors.cyan[300]!, Colors.cyan[700]!],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          // radius: double.infinity,
        ),
      ),
      child: const Column(
        children: [
          // const SizedBox(height: 10),
          ScoreBoard(),
          Expanded(
            child: Center(
              child: GameBoard(),
            ),
          ),
        ],
      ),
    );
  }
}
