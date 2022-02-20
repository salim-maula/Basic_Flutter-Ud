// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AlertNotifPage extends StatefulWidget {
  @override
  _AlertNotifPageState createState() => _AlertNotifPageState();
}

class _AlertNotifPageState extends State<AlertNotifPage> {
  FToast fToast;

  void openSnackBar() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Succes buy course'),
        duration: Duration(milliseconds: 2500),
        action: SnackBarAction(
            label: 'Action',
            onPressed: () {
              print('delete item');
            }),
      ),
    );
  }

  void openToast() {
    // Fluttertoast.showToast(
    //     msg: "This is Center Short Toast",
    //     toastLength: Toast.LENGTH_SHORT,
    //     gravity: ToastGravity.CENTER,
    //     timeInSecForIosWeb: 1,
    //     backgroundColor: Colors.red,
    //     textColor: Colors.white,
    //     fontSize: 16.0
    // );
    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.greenAccent,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.check),
          SizedBox(
            width: 12.0,
          ),
          Text("This is a Custom Toast"),
        ],
      ),
    );

    // FToast f = FToast();
    fToast.showToast(
      child: toast,
      gravity: ToastGravity.CENTER,
      toastDuration: Duration(seconds: 2),
    );
  }

  //material ini akan berfungsi di semua halaman
  //akan tetapi kalo kita sudah back dari halaman berikutnya kita akan mengalami error
  void openMaterialBanner() {
    ScaffoldMessenger.of(context).showMaterialBanner(
      MaterialBanner(
        backgroundColor: Colors.amber[200],
        content: Text("There is an update"),
        actions: [
          TextButton(
            onPressed: () {
              ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
            },
            child: Text("Update"),
          ),
          TextButton(
            onPressed: () {
              ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
            },
            child: Text("Dismiss"),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    fToast = FToast();
    fToast.init(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
            Future.delayed(Duration(milliseconds: 800), () {
              Navigator.pop(context);
            });
          },
          icon: Icon(Icons.arrow_back),
        ),
        title: Text('Alert Notif Page'),
        titleSpacing: 0,
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          ElevatedButton(
            onPressed: () => openSnackBar(),
            child: Text('Snackbar'),
          ),
          ElevatedButton(
            onPressed: () => openToast(),
            child: Text('Toast'),
          ),
          ElevatedButton(
            onPressed: () => openMaterialBanner(),
            child: Text('Material Banner'),
          ),
        ],
      ),
    );
  }
}
