import 'package:flutter/material.dart';

class TabbarPage extends StatefulWidget {
  @override
  _TabbarPageState createState() => _TabbarPageState();
}

class _TabbarPageState extends State<TabbarPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Tabbar Page'),
          titleSpacing: 0,
          bottom: TabBar(
            tabs: [
              Tab(
                text: 'Payment',
                iconMargin: EdgeInsetsDirectional.only(bottom: 0),
                icon: Icon(Icons.payment),
              ),
              Tab(
                text: 'History',
                icon: Icon(Icons.history),
                iconMargin: EdgeInsetsDirectional.only(bottom: 0),
              ),
            ],
          ),
        ),
        body: TabBarView(children: [
          Center(child: Text('Payment'),),
          Center(child: Text('History'),)
        ],),
      ),
    );
  }
}
