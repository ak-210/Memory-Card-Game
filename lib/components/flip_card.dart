import 'dart:math';

import 'package:flutter/material.dart';

class FlipCard extends StatefulWidget {
  final FlipCardController controller;
  final IconData front;
  final IconData back;
  final bool selected;
  const FlipCard({
    super.key,
    required this.front,
    this.back = Icons.question_mark,
    required this.controller,
    required this.selected,
  });

  @override
  State<FlipCard> createState() => _FlipCardState();
}

class FlipCardController {
  _FlipCardState? _state;

  Future flipCard() async => _state?.flipCard();
}

class _FlipCardState extends State<FlipCard> with TickerProviderStateMixin {
  late AnimationController _controller;
  bool isFront = true;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    widget.controller._state = this;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future flipCard() async {
    if (isFront) {
      await _controller.forward();
    } else {
      await _controller.reverse();
    }
    isFront = !isFront;
    print('flipped');
  }

  @override
  Widget build(BuildContext context) => AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          final angle = _controller.value * -pi;
          final transform = Matrix4.identity()
            ..setEntry(3, 2, 0.002)
            ..rotateY(angle);
          return Transform(
            transform: transform,
            alignment: Alignment.center,
            child: isFront
                ? Container(
                    decoration: BoxDecoration(
                      // color: widget.selected ? Colors.red : Colors.white,
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: const Color.fromARGB(148, 80, 80, 80),
                        width: 5,
                      ),
                    ),
                    child: Center(
                      child: Icon(widget.front),
                    ),
                  )
                : Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: const Color.fromARGB(148, 80, 80, 80),
                        width: 5,
                      ),
                    ),
                    child: Center(
                      child: Icon(widget.back),
                    ),
                  ),
          );
        },
      );
}
