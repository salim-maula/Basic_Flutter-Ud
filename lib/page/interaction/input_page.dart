import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  var _controllerName = TextEditingController();
  var _controllerUsername = TextEditingController();
  var _controllerPassword = TextEditingController();
  var _formKey = GlobalKey<FormState>();
  String _gender = 'laki-laki';
  bool _rememberMe = false;
  List<String> _days = [
    'Sunday',
    'Monday',
    'Thursday',
    'wednesday',
    'Tuesday',
    'Friday',
    'Saturday'
  ];
  List<String> _selectedDays = [];
  bool _darkMode = false;
  double _sliderValue = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          titleSpacing: 0,
          title: Text('Input Page'),
        ),
        body: ListView(
          children: [
            ListTile(
              title: Text('Text Field'),
            ),
            TextField(),
            _textField(),
            ListTile(
              title: Text('Text Form Field'),
            ),
            _textFormField(),
            ListTile(
              title: Text('Radio'),
            ),
            _radio(),
            ListTile(
              title: Text('Check Box'),
            ),
            _checkBox(),
            ListTile(
              title: Text('Switch'),
            ),
            _switch(),
            ListTile(
              title: Text('Slider'),
            ),
            _slider(),
          ],
        ),
    );
  }

  Widget _textField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          SizedBox(
            height: 8,
          ),
          TextField(
            controller: _controllerName,
            decoration: InputDecoration(
              labelText: 'name',
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.amber),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.amber),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.amber),
              ),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          TextField(
            obscureText: true,
            controller: _controllerName,
            decoration: InputDecoration(
                labelText: 'Password',
                hintText: 'input password ',
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.amber),
                ),
                prefixIcon: Icon(Icons.vpn_key),
                suffixIcon: Icon(Icons.visibility)),
          ),
          SizedBox(
            height: 8,
          ),
          TextField(
            controller: _controllerName,
            decoration: InputDecoration(
              labelText: 'input name',
            ),
          ),
          SizedBox(
            height: 8,
          ),
          ElevatedButton(
            onPressed: () {
              print(_controllerName.text);
            },
            child: Text('Submit TextField'),
          )
        ],
      ),
    );
  }

  Widget _textFormField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              validator: (value) => value == '' ? "Don't Empty" : null,
              controller: _controllerUsername,
              decoration: InputDecoration(labelText: 'Username'),
            ),
            TextFormField(
              validator: (value) => value == '' ? "Don't Empty" : null,
              controller: _controllerPassword,
              decoration: InputDecoration(labelText: 'Password'),
            ),
            SizedBox(
              height: 16,
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  print(_controllerUsername.text);
                  print(_controllerPassword.text);
                }
              },
              child: Text('Submit TextFormField'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _radio() {
    return Column(
      children: [
        ListTile(
          onTap: () => setState(() => _gender = 'laki-laki'),
          leading: Radio(
            value: 'laki-laki',
            groupValue: _gender,
            onChanged: (value) {
              setState(() => _gender = value.toString());
            },
          ),
          title: Text('laki-laki'),
        ),
        ListTile(
          onTap: () => setState(() => _gender = 'perempuan'),
          leading: Radio(
            value: 'perempuan',
            groupValue: _gender,
            onChanged: (value) {
              setState(() => _gender = value.toString());
            },
          ),
          title: Text('perempuan'),
        ),
      ],
    );
  }

  Widget _checkBox() {
    return Column(
      children: [
        ListTile(
          onTap: () => setState(() => _rememberMe = !_rememberMe),
          leading: Checkbox(
            value: _rememberMe,
            onChanged: (value) => setState(() => _rememberMe = value),
          ),
          title: Text('Remember Me'),
        ),
        SizedBox(height: 8),
        Column(
          children: List.generate(_days.length, (index) {
            String day = _days[index];
            return CheckboxListTile(
              title: Text(day),
              value: _selectedDays.contains(day),
              onChanged: (value) {
                if (value) {
                  _selectedDays.add(day);
                } else {
                  _selectedDays.remove(day);
                }
                setState(() {});
                print(_selectedDays);
              },
            );
          }),
        )
      ],
    );
  }

  Widget _switch() {
    return ListTile(
      onTap: () => setState(() => _darkMode = !_darkMode),
      title: Text('Dark Mode'),
      trailing: Switch(
        value: _darkMode,
        onChanged: (value) => setState(() => _darkMode = value),
      ),
    );
  }

  Widget _slider() {
    return Slider(
      value: _sliderValue,
      min: 0,
      max: 10,
      label: '$_sliderValue',
      divisions: 20,
      onChanged: (value) {
        setState(() => _sliderValue=value);
      },
    );
  }
}
