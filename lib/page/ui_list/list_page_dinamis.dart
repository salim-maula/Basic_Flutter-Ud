import 'package:flutter/material.dart';

class ListPageDinamis extends StatefulWidget {
  @override
  _ListPageDinamisState createState() => _ListPageDinamisState();
}

class _ListPageDinamisState extends State<ListPageDinamis> {
  List _fruits = [
    'Semangka',
    'Anggur',
    'Strawberi',
    'Jambu',
    'Nanas',
    'Jeruk',
    'Pepaya',
    'Melon',
    'Pisang',
    'Kiwi',
    'Durian'
  ];

  void addItem(){
    _fruits.add('Buah');
    setState(() {
          
        });
  }

  void deleteItem(int indexItem){
      _fruits.removeAt(indexItem);
      setState(() {
              
            });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List Page Dinamis'),
        titleSpacing: 0,
      ),
      body: Scrollbar(
        isAlwaysShown: true,
        child: ListView.separated(
          separatorBuilder: (context, index) =>Divider(height: 1,indent: 16,endIndent: 16,color: Colors.black,),
          itemCount: _fruits.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: CircleAvatar(
                child: Text(
                  "${index + 1}",
                ),
              ),
              title: Text(_fruits[index]),
              trailing: IconButton(
                icon: Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
                onPressed: () =>deleteItem(index),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>addItem(),
        child: Icon(Icons.add)
      ),
    );
  }
}
