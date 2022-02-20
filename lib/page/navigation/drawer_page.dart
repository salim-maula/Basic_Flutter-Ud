import 'package:flutter/material.dart';
import 'package:flutter_only/page/navigation/fragment/fragment_dashboard.dart';
import 'package:flutter_only/page/navigation/fragment/fragment_notification.dart';
import 'package:flutter_only/page/navigation/fragment/fragment_setting.dart';

class DrawerPage extends StatefulWidget {
  @override
  _DrawerPageState createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {

  final List _listFragment = [
    {
      'title' : 'Dashboard',
      'fragment' : FragmentDashboard(),
    },
    {
      'title' : 'Notification',
      'fragment' : FragmentNotification(),
    },
    {
      'title' : 'Setting',
      'fragment' : FragmentSetting(),
    },
  ];
  int _currentFragment = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_listFragment[_currentFragment]['title']),
        titleSpacing: 0,
      ),
      drawer: _drawer(),
      body: _listFragment[_currentFragment]['fragment'],
    );
  }

  Drawer _drawer() => Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(80),
                    child: Image.asset('asset/image/profile.jpg', height: 80, width: 80,fit: BoxFit.cover,)),
                  SizedBox(height: 16,),
                  Text('Salim Maula Hudzaifah',style: TextStyle(color: Colors.white),),
                  SizedBox(height: 4,),
                  Text('salim@gmail.com',style: TextStyle(color: Colors.white70),),
                ],
              ),
            ),
            ListTile(
              onTap: () {
                setState(()=>_currentFragment=0);
                Navigator.pop(context);
              },
              leading: Icon(Icons.dashboard),
              title: Text('Dashboard'),
              trailing: Icon(Icons.navigate_next),
            ),
            ListTile(
              leading: Icon(Icons.notifications),
              onTap: () {
                setState(()=>_currentFragment=1);
                Navigator.pop(context);
              },
              title: Text('Notification'),
              trailing: Icon(Icons.navigate_next),
            ),
             ListTile(
              leading: Icon(Icons.settings),
              onTap: () {
                setState(()=>_currentFragment=2);
                Navigator.pop(context);
              },
              title: Text('Setting'),
              trailing: Icon(Icons.navigate_next),
            ),
            Divider(color: Colors.grey,),
            ListTile(
              leading: Icon(Icons.logout),
              onTap: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
              title: Text('Logout'),
              trailing: Icon(Icons.navigate_next),
            ),
          ],
        ),
      );
}
