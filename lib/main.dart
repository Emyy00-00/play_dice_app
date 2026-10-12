import 'package:flutter/material.dart';
import 'dart:math';
import 'dicee.dart';

void main() {
  runApp(const PlayDiceApp());
}

class PlayDiceApp extends StatelessWidget {
  const PlayDiceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DiceScreen(),
    );
  }
}

class DiceScreen extends StatefulWidget {
  const DiceScreen({super.key});

  @override
  State<DiceScreen> createState() => _DiceScreenState();
}

class _DiceScreenState extends State<DiceScreen> {
  int leftDiceNumber = 1;
  int rightDiceNumber = 2;
  String imagePath = 'assets/sad.jpg';

  void rollDice() {
    setState(() {
      leftDiceNumber = Random().nextInt(6) + 1;
      rightDiceNumber = Random().nextInt(6) + 1;

      int total = leftDiceNumber + rightDiceNumber;

      if (total >= 10) {
        imagePath = 'assets/happy.jpg';
      } else {
        imagePath = 'assets/sad.jpg';
      }
    });
  }

  void resetDice() {
    setState(() {
      leftDiceNumber = 1;
      rightDiceNumber = 1;
      imagePath = 'assets/sad.jpg';
    });
  }

  @override
  Widget build(BuildContext context) {
    int total = leftDiceNumber + rightDiceNumber;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Play Dice'),
        backgroundColor: Colors.purple,
        centerTitle: true,
        leading: const Icon(Icons.casino),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Total: $total',
              style: const TextStyle(
                fontSize: 28,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),

            Image.asset(
              imagePath,
              width: 120,
              height: 120,
            ),
            const SizedBox(height: 30),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Dice(diceNumber: leftDiceNumber),
                const SizedBox(width: 20),
                Dice(diceNumber: rightDiceNumber),
              ],
            ),
            const SizedBox(height: 40),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                child: ElevatedButton(
                  onPressed: rollDice,
                  child: const Text('Roll Dice'),
                ),
                ),
                const SizedBox(width: 15),
                 Expanded(child: ElevatedButton(

                   onPressed: resetDice,
                  child: const Text('Reset'),
                ),
                ),

              ],
            ),
          ],
        ),
      ),
    );
  }
}