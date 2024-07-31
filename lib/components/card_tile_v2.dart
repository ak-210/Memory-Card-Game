import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:memory_card_game/models/card_model.dart';
import 'package:flip_card/flip_card.dart';
import 'package:memory_card_game/providers/flipped_cards.dart';
import 'package:memory_card_game/providers/selection_provider.dart';
import 'package:memory_card_game/providers/turn_provider.dart';
import 'package:memory_card_game/services/get_size.dart';

class CardTileV2 extends StatefulWidget {
  final CardModel card;
  const CardTileV2(
    this.card, {
    super.key,
  });

  @override
  State<CardTileV2> createState() => _CardTileV2State();
}

class _CardTileV2State extends State<CardTileV2> {
  CardModel get card => widget.card;
  late FlipCardController _controller;
  @override
  void initState() {
    super.initState();
    _controller = FlipCardController();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (BuildContext context, WidgetRef ref, Widget? child) {
      final selected = ref.watch(selectionsProvider).contains(card);
      return FlipCard(
        controller: _controller,
        front: !card.discarded
            ? Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.brown[400]!,
                      Colors.brown[700]!,
                      Colors.brown[400]!,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    color: const Color.fromARGB(184, 161, 136, 127),
                    width: 5,
                  ),
                ),
                child: Center(
                  child: Icon(
                    card.icon,
                    color: Colors.brown[100]!,
                    size: iconSize,
                  ),
                ),
              )
            : Container(),
        back: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.brown[600]!,
                Colors.brown[300]!,
                Colors.brown[600]!,
              ],
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
            ),
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
              color: const Color.fromARGB(179, 29, 19, 17),
              width: 5,
            ),
          ),
          child: Center(
            child: Icon(
              Icons.question_mark,
              color: Colors.brown[800]!,
              size: iconSize - 5,
            ),
          ),
        ),
        side: CardSide.BACK,
        flipOnTouch: !selected && !card.discarded,
        onFlip: () async {
          final canClick = ref.read(selectionsProvider).length < 2;
          if (!selected && canClick) {
            ref.read(flippedCardProvider.notifier).state.add(_controller);
            cardSelected(card, ref);
          }
        },
      );
    });
  }

  void cardSelected(CardModel card, WidgetRef ref) {
    ref.read(selectionsProvider.notifier).addCard(card);
    if (ref.read(selectionsProvider).length == 2) {
      ref.read(turnNotifierProvider.notifier).nextTurn();
    }
  }
}
