import 'package:flutter/material.dart';

class CardModel {
  final IconData icon;
  final int id;
  bool selected;
  bool discarded;

  CardModel(this.id, this.icon, {this.selected = false, this.discarded = false});
}
