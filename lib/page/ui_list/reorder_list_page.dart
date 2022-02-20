import 'package:flutter/material.dart';

class ReorderListPage extends StatefulWidget {
  @override
  _ReorderListPageState createState() => _ReorderListPageState();
}

class _ReorderListPageState extends State<ReorderListPage> {
  final List _categories = [
    'Drama',
    'Action',
    'Thriller',
    'Sci-fi',
    'Fantasy',
    'Romance',
    'Adventure'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List Page'),
        titleSpacing: 0,
      ),
      body: ReorderableListView.builder(
        itemCount: _categories.length,
        onReorder: (oldIndex, newIndex) {
          if(oldIndex < newIndex){
            newIndex -= 1;
          }
          String itemRemove = _categories.removeAt(oldIndex);
          _categories.insert(newIndex, itemRemove);
          setState(() {
                      
                    });
        },
        itemBuilder: (context, index) {
          return ListTile(
            key: Key('$index'),
            leading: CircleAvatar(
              child: Text('${index + 1}'),
            ),
            title: Text(_categories[index]),
          );
        },
      ),
    );
  }
}
