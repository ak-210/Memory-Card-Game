import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:memory_card_game/models/player_model.dart';

final players = [
  PlayerModel(0, Colors.red, 'Red'),
  PlayerModel(1, Colors.blue, 'Blue'),
  PlayerModel(2, Colors.green, 'Green'),
  PlayerModel(3, Colors.yellow, 'Yellow'),
];

final playersProvider = Provider<List<PlayerModel>>((ref) {
  int num = ref.watch(numOfPlayerProvider);
  return players.take(num).toList();
});

final numOfPlayerProvider = StateProvider<int>((ref) => 0);
