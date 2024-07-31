import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:memory_card_game/models/player_model.dart';
import 'package:memory_card_game/providers/flipped_cards.dart';
import 'package:memory_card_game/providers/no_of_cards_provider.dart';
import 'package:memory_card_game/providers/player_provider.dart';
import 'package:memory_card_game/providers/selection_provider.dart';

part 'turn_provider.g.dart';

@riverpod
class TurnNotifier extends _$TurnNotifier {
  int index = 0;
  int selection = 0;
  List<PlayerModel> players = [];
  @override
  PlayerModel build() {
    players = ref.read(playersProvider);
    return players[0];
  }

  void nextTurn() async {
    final selections = ref.read(selectionsProvider);
    print(selections);
    await Future.delayed(const Duration(seconds: 1), () {});
    if (selections[0].id == selections[1].id) {
      state.points += 10;
      selections[0].discarded = true;
      selections[1].discarded = true;
      ref.read(discardedNoProvider.notifier).state += 2;
    } else {
      final cards = ref.read(flippedCardProvider);
      cards[0].toggleCard();
      cards[1].toggleCard();
      index = (index + 1) % players.length;
      state = players[index];
    }

    ref.read(selectionsProvider.notifier).emptyCards();
    ref.read(flippedCardProvider.notifier).state = [];
  }
}
