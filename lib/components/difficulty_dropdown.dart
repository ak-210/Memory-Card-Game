import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:memory_card_game/providers/difficulty_provider.dart';
import 'package:memory_card_game/screens/kanit_text.dart';

class DifficultyDropdown extends ConsumerWidget {
  const DifficultyDropdown({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DropdownButton(
      value: ref.watch(difficultyProvider),
      onChanged: (value) {
        ref.read(difficultyProvider.notifier).state = value ?? Difficulty.EASY;
      },
      style: kanitTextStyle(bold: true, size: 16),
      dropdownColor: const Color.fromARGB(92, 0, 0, 0),
      borderRadius: BorderRadius.circular(10),
      underline: const SizedBox.shrink(),
      iconEnabledColor: Colors.white,
      items: const [
        DropdownMenuItem(
          value: Difficulty.EASY,
          child: Text('Easy'),
        ),
        DropdownMenuItem(
          value: Difficulty.MEDIUM,
          child: Text('Medium'),
        ),
        DropdownMenuItem(
          value: Difficulty.HARD,
          child: Text('Hard'),
        ),
      ],
    );
  }
}
