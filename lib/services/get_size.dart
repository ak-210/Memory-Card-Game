import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:memory_card_game/providers/difficulty_provider.dart';

late double iconSize;
late double spacing;
late int axisCount;

void getSizes(WidgetRef ref) {
  final diff = ref.watch(difficultyProvider);
  switch (diff) {
    case (Difficulty.EASY):
      iconSize = 40;
      spacing = 25;
      axisCount = 3;
      break;
    case (Difficulty.MEDIUM):
      iconSize = 35;
      spacing = 10;
      axisCount = 4;
      break;
    case (Difficulty.HARD):
      iconSize = 30;
      spacing = 10;
      axisCount = 5;
      break;
  }
}
