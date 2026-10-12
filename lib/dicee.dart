import 'package:flutter/material.dart';

class Dice extends StatelessWidget {
  final int diceNumber; // المتغير اللي هيستقبل رقم النرد من 1 لـ 6

  const Dice({super.key, required this.diceNumber});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        color: Colors.deepPurple[200],
        borderRadius: BorderRadius.circular(12),
      ),

        child: Center(
            child: Text(
              '$diceNumber',
              style: const TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
        ),
    );
  }
}