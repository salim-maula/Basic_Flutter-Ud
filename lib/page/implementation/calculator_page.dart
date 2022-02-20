import 'package:flutter/material.dart';

class CalculatorPage extends StatefulWidget {
  @override
  _CalculatorPageState createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  var _controllerA = TextEditingController();
  var _controllerB = TextEditingController();
  var _formKey = GlobalKey<FormState>();
  double _result = 0;


  void count(String op) {
    if (_formKey.currentState.validate()) {
      double valueA = double.parse(_controllerA.text);
      double valueB = double.parse(_controllerB.text);
      switch (op) {
        case '+':
          _result = valueA + valueB;
          break;
        case '-':
          _result = valueA - valueB;
          break;
        case '*':
          _result = valueA * valueB;
          break;
        case '/':
          _result = valueA / valueB;
          break;
        default:
          _result = 0;
          break;
      }
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Calculator Page'), titleSpacing: 0),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            buildInput(_controllerA, 'Value A'),
            const SizedBox(height: 16),
            buildInput(_controllerB, 'Value B'),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () => count('+'),
                  child: const Text('+'),
                ),
                ElevatedButton(
                  onPressed: () => count('-'),
                  child: const Text('-'),
                ),
                ElevatedButton(
                  onPressed: () => count('*'),
                  child: const Text('*'),
                ),
                ElevatedButton(
                  onPressed: () => count('/'),
                  child: const Text('/'),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              'Result: ${_result.toStringAsFixed(3)} ',
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildInput(TextEditingController controller, String label) {
    return TextFormField(
      controller: controller,
      validator: (value) => value == '' ? "Don't empty" : null,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: label,
      ),
      keyboardType: TextInputType.number,
    );
  }
}
