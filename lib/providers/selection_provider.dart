import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:memory_card_game/models/card_model.dart';

part 'selection_provider.g.dart';

@riverpod
class Selections extends _$Selections {
  @override
  List<CardModel> build() {
    return [];
  }

  void addCard(CardModel card) {
    state = [...state, card];
  }

  void emptyCards() {
    state = [];
  }
}
