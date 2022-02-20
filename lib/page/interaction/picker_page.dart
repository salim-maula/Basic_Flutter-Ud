
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class PickerPage extends StatefulWidget {
  @override
  _PickerPageState createState() => _PickerPageState();
}

class _PickerPageState extends State<PickerPage> {

  Uint8List _imageData;

  void getDate() async {
    DateTime result = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(DateTime.now().year + 1),
    );
    if (result != null) {
      print(result.toIso8601String());
      DateFormat dateFormat = DateFormat('yyyy-MM-dd');
      String date = dateFormat.format(result);
      print('Date : $date');
    }
  }

  void getRangePicker() async {
    var result = await showDateRangePicker(
      context: context,
      firstDate: DateTime(1900),
      lastDate: DateTime(DateTime.now().year + 1),
    );
    if (result != null) {
      print(result.start.toIso8601String());
      print(result.end.toIso8601String());
      print('${result.duration.inDays} Hari');
    }
  }

  void getTime() async {
    var result = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if(result!=null){
      print('Jam : ${result.hour}');
    }
  }

  void getImage(ImageSource source) async {
    final ImagePicker picker = ImagePicker();
    final XFile image = await picker.pickImage(source: source);
    if(image != null){
      print( image.name);
      Uint8List imageByte = await image.readAsBytes();
      File imageFile = File(image.path);
      setState(() {
        _imageData = imageByte;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: Text('Picker Page'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          ElevatedButton(
            onPressed: () => getDate(),
            child: Text('Date Picker'),
          ),
          ElevatedButton(
            onPressed: () => getRangePicker(),
            child: Text('Date Range Picker'),
          ),
          ElevatedButton(
            onPressed: () => getTime(),
            child: Text('Time Picker'),
          ),
          ElevatedButton(
            onPressed: () => getImage(ImageSource.gallery),
            child: Text('Image Picker Galery'),
          ),
          ElevatedButton(
            onPressed: () => getImage(ImageSource.camera),
            child: Text('Image Picker Camera'),
          ),
          if(_imageData!=null) Image.memory(_imageData)
        ],
      ),
    );
  }
}
