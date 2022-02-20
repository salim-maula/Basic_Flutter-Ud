import 'package:flutter/material.dart';
import 'package:flutter_only/model/animal.dart';

import 'detail_page.dart';

class ListPageModel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List Page Model'),
        titleSpacing: 0,
      ),
      body: ListView.builder(
        itemCount: listAnimal.length,
        itemBuilder: (context, index) {
          Animal animal = listAnimal[index];
          return GestureDetector(
            onTap: (){
              Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DetailPage(
                        animal: animal,
                    )),
                  );
            },
            child: itemAnimal(animal, index),
          );
        },
      ),
    );
  }

  Widget itemAnimal(Animal animal, int index) {
    return Card(
      margin: EdgeInsets.fromLTRB(
          16, index == 0 ? 16 : 8, 16, index == listAnimal.length - 1 ? 16 : 8),
      elevation: 4,
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(4),
              bottomLeft: Radius.circular(4),
            ),
            child: Image.asset(
              animal.image,
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            width: 16,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  animal.name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  animal.move,
                ),
              ],
            ),
          ),
          Icon(Icons.navigate_next),
          SizedBox(
            width: 8,
          )
        ],
      ),
    );
  }
}
