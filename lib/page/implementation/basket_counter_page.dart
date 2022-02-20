import 'package:flutter/material.dart';

class BasketCounterPage extends StatefulWidget {
  @override
  _BasketCounterPageState createState() => _BasketCounterPageState();
}

class _BasketCounterPageState extends State<BasketCounterPage> {
  int _pointA = 0;
  int _pointB = 0;

  void addPointA(int point) {
    _pointA += point;
    setState(() {});
  }

  void addPointB(int point) {
    _pointB += point;
    setState(() {});
  }

  void resetPoint() {
    _pointA = 0;
    _pointB = 0;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Basket Counter Page'), titleSpacing: 0),
      body: Stack(
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  color: Colors.blue[200],
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      const Text(
                        'TEAM A',
                        style: TextStyle(fontSize: 20),
                      ),
                      const SizedBox(height: 30),
                      Text(
                        '$_pointA',
                        style: const TextStyle(fontSize: 80),
                      ),
                      const SizedBox(height: 30),
                      ElevatedButton(
                        onPressed: () => addPointA(1),
                        child: const Text('+1 Point'),
                      ),
                      ElevatedButton(
                        onPressed: () => addPointA(2),
                        child: const Text('+2 Point'),
                      ),
                      ElevatedButton(
                        onPressed: () => addPointA(3),
                        child: const Text('+3 Point'),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.amber[200],
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      const Text(
                        'TEAM B',
                        style: TextStyle(fontSize: 20),
                      ),
                      const SizedBox(height: 30),
                      Text(
                        '$_pointB',
                        style: const TextStyle(fontSize: 80),
                      ),
                      const SizedBox(height: 30),
                      ElevatedButton(
                        onPressed: () => addPointB(1),
                        child: const Text('+1 Point'),
                      ),
                      ElevatedButton(
                        onPressed: () => addPointB(2),
                        child: const Text('+2 Point'),
                      ),
                      ElevatedButton(
                        onPressed: () => addPointB(3),
                        child: const Text('+3 Point'),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton(
                  onPressed: () => resetPoint(),
                  child: const Text('RESET'),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith(
                        (states) => Colors.black),
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
