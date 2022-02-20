import 'package:flutter/material.dart';

class ListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List Page'),
        titleSpacing: 0,
      ),
      body: ListView(
        children: [
          ListTile(
            trailing: Icon(Icons.navigate_next),
            title: Text('title'),
            subtitle: Text('Subtitle'),
            tileColor: Colors.amber,
            leading: Icon(Icons.ac_unit),
          ),
          ListTile(
            trailing: Icon(Icons.navigate_next),
            title: Text('title'),
            tileColor: Colors.red[100],
            leading: Icon(Icons.ac_unit),
          ),
          ListTile(
            trailing: Icon(Icons.navigate_next),
            title: Text('title'),
            tileColor: Colors.purpleAccent,
            leading: CircleAvatar(
              backgroundColor: Colors.transparent,
              foregroundColor: Colors.white, 
              child: Icon(Icons.alarm),
            ),
            
            subtitle: Text('Subtitle'),
          ),
          ListTile(
            tileColor: Colors.cyan,
            title: Text('title'),
            leading: CircleAvatar(
              foregroundColor: Colors.white, 
              child: Text('1'),
            ),
             trailing:const Icon(Icons.navigate_next),
            onTap: (){},
          ),
          Divider(
            color: Colors.red,
            height: 1,
          ),
            ListTile(
            tileColor: Colors.cyan,
              leading: CircleAvatar(
                foregroundColor: Colors.white, 
                child: Text('2'),
              ),
              title: Text('title'),
              trailing:const Icon(Icons.navigate_next),
              onTap: (){},
            ),
        ],
      ),
    );
  }
}
