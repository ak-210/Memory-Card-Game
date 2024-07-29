import 'package:flutter/material.dart';

class PlayerModel {
  final int id;
  final Color playerColor;
  final String name;
  int points;

  PlayerModel(this.id, this.playerColor, this.name, {this.points = 0});
}
