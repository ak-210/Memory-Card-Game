import 'package:flutter/material.dart';

class HomeButton extends StatelessWidget {
  final String text;
  final void Function() onPressed;
  const HomeButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        // shadowColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.brown[400],
        foregroundColor: const Color(0xffffffff),
        // padding: const EdgeInsets.all(30),
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
            Icon(Icons.supervised_user_circle_sharp),
            Text(
              text,
            ),
          ],
        ),
      ),
    );
  }
}
