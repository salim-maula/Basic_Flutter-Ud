import 'package:flutter/material.dart';
import 'package:flutter_only/db/pref.dart';

class PrefPage extends StatefulWidget {
  @override
  _PrefPageState createState() => _PrefPageState();
}

class _PrefPageState extends State<PrefPage> {
  String _name;
  double _height;
  bool _likeSport;

  void getData() async {
    _name = await Pref.getName();
    _height = await Pref.getHeight();
    _likeSport = await Pref.getSport();
    setState(() {});
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: Text('Preferences Page'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('Name'),
            subtitle: Text(_name ?? 'Kosong'),
          ),
          Divider(
            thickness: 1,
            height: 1,
          ),
          ListTile(
            title: Text('Height'),
            subtitle: Text(_height != null ? '$_height' : 'Kosong'),
          ),
          Divider(
            thickness: 1,
            height: 1,
          ),
          ListTile(
            title: Text('Like Sport'),
            subtitle: Text(_likeSport != null ? '$_likeSport' : 'Kosong'),
          ),
          SizedBox(
            height: 16,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: (){
                Pref.saveName('Salim');
                Pref.saveHeight(190);
                Pref.saveSport(true);
                getData();
              },
              child: Text('Input & Save'),
            ),
          ),
        ],
      ),
    );
  }
}
