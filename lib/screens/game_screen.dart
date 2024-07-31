import 'package:flutter/material.dart';
import 'package:memory_card_game/components/game_board.dart';
import 'package:memory_card_game/components/score_board.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images.jpeg'),
            fit: BoxFit.fill,
          ),
        ),
        child: const SafeArea(
          child: Column(
            children: [
              ScoreBoard(),
              Expanded(
                child: Center(
                  child: GameBoard(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
