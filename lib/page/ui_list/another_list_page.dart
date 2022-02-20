import 'package:flutter/material.dart';

class AnotherListPage extends StatefulWidget {
  @override
  _AnotherListPageState createState() => _AnotherListPageState();
}

class _AnotherListPageState extends State<AnotherListPage> {
  final List _categories = [
    'Drama',
    'Action',
    'Thriller',
    'Sci-fi',
    'Fantasy',
    'Romance',
    'Adventure'
  ];

  final List<Map> _listStep = [
    {'title': 'Order', 'content': 'Make your order here'},
    {'title': 'Payment', 'content': 'Here payment can you use'},
    {'title': 'Send', 'content': 'your order has been sent'},
    {'title': 'Arrive', 'content': 'Your order has arrived'},
  ];

  //make status current index stepper
  int _currentStep = 0;
  int _currentStack = 0;

  void deleteChip(int index) {
    _categories.removeAt(index);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Another List Page'),
        titleSpacing: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _wrap(),
            _pageView(),
            SizedBox(
              height: 30,
            ),
            _stepper(),
            SizedBox(
              height: 30,
            ),
            _indexedStack(),
            _buttonCounterStack(),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }

  Stepper _stepper() {
    return Stepper(
      physics: NeverScrollableScrollPhysics(),
      onStepContinue: () {
        if (_currentStep < _listStep.length - 1) {
          setState(() => _currentStep += 1);
        }
      },
      onStepCancel: () {
        if (_currentStep > 0) {
          setState(() => _currentStep -= 1);
        }
      },
      onStepTapped: (newStep) => setState(() => _currentStep = newStep),
      currentStep: _currentStep,
      steps: List.generate(_listStep.length, (index) {
        Map itemStep = _listStep[index];
        return Step(
          title: Text(itemStep['title']),
          content: Container(
            padding: EdgeInsets.all(8),
            height: 50,
            width: double.maxFinite,
            color: Colors.amber[100],
            child: Text(itemStep['content']),
          ),
          isActive: _currentStep == index ? true : false,
          subtitle: Text(itemStep['content']),
        );
      }),
    );
  }

  SizedBox _pageView() {
    return SizedBox(
      height: 200,
      child: PageView(
        scrollDirection: Axis.horizontal,
        pageSnapping: true,
        children: _categories.map((category) {
          return Card(
            elevation: 8,
            color: Colors.amber[300],
            margin: EdgeInsets.all(16),
            child: Center(child: Text(category)),
          );
        }).toList(),
      ),
    );
  }

  Padding _wrap() {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Wrap(
        spacing: 16,
        children: List.generate(_categories.length, (index) {
          return Chip(
            backgroundColor: Colors.blue[100],
            avatar: CircleAvatar(
              child: Text('${index + 1}'),
            ),
            label: Text(_categories[index]),
            deleteIcon: Icon(Icons.clear),
            onDeleted: () => deleteChip(index),
          );
        }),
      ),
    );
  }

  Widget _indexedStack() {
    return IndexedStack(
      index: _currentStack,
      children: List.generate(_listStep.length, (index) {
        Map itemStack = _listStep[index];
        return Card(
          elevation: 4,
          color: Colors.blue[100],
          margin: EdgeInsets.all(16),
          child: Container(
            padding: EdgeInsets.all(16),
            width: double.maxFinite,
            height: 150,
            child: Column(
              children: [
                Text(
                  itemStack['title'],
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(itemStack['content']),
              ],
            ),
          ),
        );
      }),
    );
  }

  Widget _buttonCounterStack() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () {
            if (_currentStack > 0) {
              setState(() => _currentStack -= 1);
            }
          },
          child: Text('Minus 1'),
        ),
        SizedBox(
          width: 16,
        ),
        Text('Layer ${_currentStack+1}'),
        SizedBox(
          width: 16,
        ),
        ElevatedButton(
          onPressed: () {
            if (_currentStack < _listStep.length - 1) {
              setState(() => _currentStack += 1);
            }
          },
          child: Text('Plus 1'),
        ),
      ],
    );
  }
}
