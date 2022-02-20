import 'package:flutter/material.dart';
import 'package:flutter_only/model/animal.dart';

import 'detail_page.dart';

class GridPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List Page Dinamis'),
        titleSpacing: 0,
      ),
      body: GridView.builder(
        itemCount: listAnimal.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount:
              MediaQuery.of(context).orientation == Orientation.portrait
                  ? 2
                  : 3,
          childAspectRatio: 1,
          mainAxisSpacing: 4,
          crossAxisSpacing: 4,
        ),
        itemBuilder: (context, index) {
          Animal animal = listAnimal[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DetailPage(
                            animal: animal,
                          )));
            },
            child: itemGrid(animal),
          );
        },
      ),
    );
  }

  Stack itemGrid(Animal animal) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Hero(
          tag: animal.image+"from_grid_to_detail",
          child: Image.asset(
            animal.image,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            color: Colors.black.withOpacity(0.5),
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text(
              animal.name,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ),
        ),
        Positioned(
          top: 4,
          right: 4,
          child: FloatingActionButton(
            onPressed: () {},
            heroTag: animal.image,
            mini: true,
            child: Icon(
              Icons.favorite,
              color: Colors.red,
            ),
            backgroundColor: Colors.white,
          ),
        ),
      ],
    );
  }
}
