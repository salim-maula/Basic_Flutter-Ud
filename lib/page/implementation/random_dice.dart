import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class RandomDicePage extends StatefulWidget {
  @override
  _RandomDicePageState createState() => _RandomDicePageState();
}

class _RandomDicePageState extends State<RandomDicePage> {
  int _currentDice = 0;

  void randomDice() {
    _currentDice = Random().nextInt(5);
    print('${_currentDice + 1}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Random Dice Page'), titleSpacing: 0),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          SizedBox(
            height: 300,
            child: SvgPicture.asset(
              'asset/image/dice/dice_${_currentDice + 1}.svg',
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              randomDice();
              setState(() {
                
              });
            },
            child: const Text('Random'),
            
          ),
        ],
      ),
    );
  }
}
