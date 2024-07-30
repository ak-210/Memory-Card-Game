import 'package:flutter/material.dart';
import 'package:riverpod_demo/components/game_board.dart';
import 'package:riverpod_demo/components/score_board.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: const EdgeInsets.only(top: 30),
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images.jpeg'),
              fit: BoxFit.fill,
            ),
          ),
          child: const Column(
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
