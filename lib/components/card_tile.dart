import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_demo/components/flip_card.dart';
import 'package:riverpod_demo/models/card_model.dart';
import 'package:riverpod_demo/providers/selection_provider.dart';
import 'package:riverpod_demo/providers/turn_provider.dart';

class CardTile extends ConsumerWidget {
  final CardModel card;
  CardTile(this.card, {super.key});

  final controller = FlipCardController();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selected = ref.watch(selectionsProvider).contains(card);

    return GestureDetector(
      onTap: () async {
        final canClick = ref.read(selectionsProvider).length < 2;
        if (!selected && canClick) {
          await controller.flipCard();
          cardSelected(card, ref);
        }
      },
      child: FlipCard(
        front: card.icon,
        controller: controller,
        selected: card.discarded ? true : selected,
      ),
    );

    // return AnimatedCrossFade(
    // firstChild: GestureDetector(
    //   onTap: () async {
    //     final canClick = ref.read(selectionsProvider).length < 2;
    //     if (!selected && canClick) {
    //       await controller.flipCard();
    //       cardSelected(card, ref);
    //     }
    //   },
    //   child: FlipCard(
    //     front: card.icon,
    //     controller: controller,
    //     selected: selected,
    //   ),
    // ),
    //   secondChild: FlipCard(
    //     front: Icons.done,
    //     controller: controller,
    //     selected: true,
    //   ),
    //   crossFadeState: !card.discarded ? CrossFadeState.showFirst : CrossFadeState.showSecond,
    //   duration: Duration(milliseconds: 200),
    // );
  }

  void cardSelected(CardModel card, WidgetRef ref) {
    ref.read(selectionsProvider.notifier).addCard(card);
    if (ref.read(selectionsProvider).length == 2) {
      ref.read(turnNotifierProvider.notifier).nextTurn();
    }
  }
}
