import 'package:flutter/material.dart';

import 'fragment/fragment_dashboard.dart';
import 'fragment/fragment_notification.dart';
import 'fragment/fragment_setting.dart';

class BottomNavPage extends StatefulWidget {
  @override
  _BottomNavPageState createState() => _BottomNavPageState();
}

class _BottomNavPageState extends State<BottomNavPage> {
  int _indexNav = 0;
  final List _listNav = [
    {
      'label': 'Dashboard',
      'icon_on': Icons.dashboard,
      'icon_off': Icons.dashboard_outlined,
      'fragment': FragmentDashboard(),
    },
    {
      'label': 'Notification',
      'icon_on': Icons.notifications,
      'icon_off': Icons.notifications_none,
      'fragment': FragmentNotification(),
    },
    {
      'label': 'Setting',
      'icon_on': Icons.settings,
      'icon_off': Icons.settings_applications,
      'fragment': FragmentSetting(),
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _listNav[_indexNav]['fragment'],
      bottomNavigationBar: _botomNav(),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: Icon(Icons.add),
      ),
    );
  }

  BottomNavigationBar _botomNav() {
    return BottomNavigationBar(
      currentIndex: _indexNav,
      selectedFontSize: 12,
      onTap: (value) => setState(()=> _indexNav=value),
      items: _listNav.map((e) {
        return BottomNavigationBarItem(
          icon: Icon(e['icon_off']),
          label: e['label'],
          activeIcon: Icon(e['icon_on']),
        );
      }).toList(),
    );
  }
}
