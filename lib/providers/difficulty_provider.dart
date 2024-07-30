// ignore_for_file: constant_identifier_names

import 'package:hooks_riverpod/hooks_riverpod.dart';

enum Difficulty {
  EASY,
  MEDIUM,
  HARD,
}

final difficultyProvider = StateProvider<Difficulty>((ref) => Difficulty.EASY);
