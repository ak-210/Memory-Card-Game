import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_demo/models/player_model.dart';

final players = [
  PlayerModel(0, Colors.red, 'Red'),
  PlayerModel(1, Colors.blue, 'Blue'),
  PlayerModel(2, Colors.green, 'Green'),
  PlayerModel(3, Colors.yellow, 'Yellow'),
];

final playersProvider = Provider<List<PlayerModel>>((ref) => players.take(3).toList());
