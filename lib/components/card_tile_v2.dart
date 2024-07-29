import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_demo/models/card_model.dart';
import 'package:flip_card/flip_card.dart';
import 'package:riverpod_demo/providers/flipped_cards.dart';
import 'package:riverpod_demo/providers/selection_provider.dart';
import 'package:riverpod_demo/providers/turn_provider.dart';

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
        front: Container(
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [
                Colors.white,
                Color.fromARGB(255, 137, 160, 171),
                Colors.white,
              ],
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
            ),
            borderRadius: BorderRadius.circular(5),
            // border: Border.all(
            //   color: const Color.fromARGB(148, 80, 80, 80),
            //   width: 5,
            // ),
          ),
          child: Center(
            child: Icon(!card.discarded ? card.icon : Icons.done),
          ),
        ),
        back: Container(
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Colors.blueGrey, Colors.white, Colors.blueGrey],
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
            ),
            // color: Colors.orange[200],
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
              color: const Color.fromARGB(148, 80, 80, 80),
              width: 5,
            ),
          ),
          child: const Center(
            child: Icon(
              Icons.question_mark,
              // color: Colors.orange[700],
            ),
          ),
        ),
        side: CardSide.BACK,
        flipOnTouch: !selected && !card.discarded,
        onFlip: () async {
          final canClick = ref.read(selectionsProvider).length < 2;
          if (!selected && canClick) {
            ref.read(flippedCardProvider.notifier).state.add(_controller);
            // print('object');
            cardSelected(card, ref);
            // print(ref.read(selectionsProvider));
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