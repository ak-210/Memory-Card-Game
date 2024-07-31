import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:memory_card_game/components/difficulty_dropdown.dart';
import 'package:memory_card_game/components/home_button.dart';
import 'package:memory_card_game/screens/kanit_text.dart';
import 'package:memory_card_game/services/new_game.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.all(30),
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Center(
              child: Text(
                'Memory Card Game',
                style: kanitTextStyle(
                  bold: true,
                  size: 40,
                  letterSpacing: 2,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Difficulty',
                  style: kanitTextStyle(size: 20, letterSpacing: 1.5),
                ),
                const DifficultyDropdown(),
              ],
            ),
          ),
          GridView.count(
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 1,
            childAspectRatio: 5,
            mainAxisSpacing: 25,
            shrinkWrap: true,
            children: [
              HomeButton(
                onPressed: () {
                  newGame(2, ref, context);
                },
                text: 'Two',
                icon: Icons.looks_two_outlined,
              ),
              HomeButton(
                onPressed: () {
                  newGame(3, ref, context);
                },
                text: 'Three',
                icon: Icons.looks_3_outlined,
              ),
              HomeButton(
                onPressed: () {
                  newGame(4, ref, context);
                },
                text: 'Four',
                icon: Icons.looks_4_outlined,
              ),
            ],
          )
        ],
      ),
    );
  }
}
