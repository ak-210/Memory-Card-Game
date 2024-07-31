import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:memory_card_game/providers/difficulty_provider.dart';

final noOfCardsProvider = Provider((ref) {
  final diff = ref.watch(difficultyProvider);
  switch (diff) {
    case Difficulty.EASY:
      return 12;
    case Difficulty.MEDIUM:
      return 20;
    case Difficulty.HARD:
      return 30;
  }
});

final discardedNoProvider = StateProvider<int>((ref) => 0);
