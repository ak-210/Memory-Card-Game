import 'package:flutter/material.dart';
import 'package:memory_card_game/screens/kanit_text.dart';

class HomeButton extends StatelessWidget {
  final String text;
  final void Function() onPressed;
  final IconData icon;
  const HomeButton({super.key, required this.text, required this.onPressed, required this.icon});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.brown[400],
        foregroundColor: const Color(0xffffffff),
        shape: RoundedRectangleBorder(
            side: BorderSide(
              color: Colors.brown[700]!,
              width: 5,
            ),
            borderRadius: BorderRadius.circular(20)),
      ),
      onPressed: onPressed,
      child: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(icon, size: 24),
            const SizedBox(width: 10),
            Text(
              '$text Players',
              style: kanitTextStyle(size: 18, letterSpacing: 1.5),
            ),
          ],
        ),
      ),
    );
  }
}
