import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_demo/models/card_model.dart';
import 'package:riverpod_demo/providers/no_of_cards_provider.dart';

final cardProvider = Provider<List<CardModel>>((ref) {
  final int num = ref.read(noOfCardsProvider);
  List<CardModel> cards = [];

  List<IconData> icon = [
    Icons.android,
    Icons.access_alarm,
    Icons.account_balance_wallet,
    Icons.ac_unit_rounded,
    Icons.face_2,
    Icons.workspace_premium_rounded,
    Icons.emoji_events,
    Icons.emoji_emotions,
    Icons.face_6,
    Icons.apple,
    Icons.filter_hdr_rounded,
    Icons.directions_bike_rounded,
    Icons.brush,
    Icons.music_note,
    Icons.settings,
  ];

  for (int i = 0; i < num; i++) {
    cards.add(CardModel(i ~/ 2, icon[i ~/ 2]));
  }
  cards.shuffle();

  return cards;
});
