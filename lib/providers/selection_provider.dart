import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_demo/models/card_model.dart';

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
