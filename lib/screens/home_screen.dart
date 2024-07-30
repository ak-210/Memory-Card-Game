import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_demo/components/difficulty_dropdown.dart';
import 'package:riverpod_demo/components/home_button.dart';
import 'package:riverpod_demo/screens/kanit_text.dart';
import 'package:riverpod_demo/services/new_game.dart';

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
          Text(
            'Memory Card Game',
            style: kanitTextStyle(
              bold: true,
              size: 40,
              letterSpacing: 2,
            ),
            textAlign: TextAlign.center,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Difficulty',
                style: kanitTextStyle(size: 20),
              ),
              const DifficultyDropdown(),
            ],
          ),
          GridView.count(
            crossAxisCount: 1,
            childAspectRatio: 5,
            mainAxisSpacing: 20,
            shrinkWrap: true,
            children: [
              HomeButton(
                onPressed: () {
                  newGame(2, ref, context);
                },
                text: 'Two',
              ),
              HomeButton(
                onPressed: () {
                  newGame(3, ref, context);
                },
                text: 'Three',
              ),
              HomeButton(
                onPressed: () {
                  newGame(4, ref, context);
                },
                text: 'Four',
              ),
            ],
          )
        ],
      ),
    );
  }
}
