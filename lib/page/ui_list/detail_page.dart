import 'package:flutter/material.dart';
import 'package:flutter_only/db/db_animal.dart';
import 'package:flutter_only/model/animal.dart';

class DetailPage extends StatefulWidget {
  final Animal animal;

  const DetailPage({Key key, this.animal});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {

  bool _isBookmarked = false;

  void checkAnimal() async {
    print('checkAnimal');
    _isBookmarked = await DBAnimal().checkAnimal(widget.animal.name);
    setState(() {});
  }

   void addBookmarkAnimal() {
    print('addBookmarkAnimal');
    DBAnimal().insertAnimal(widget.animal);
    checkAnimal();
  }

  void deleteBookmarkAnimal() {
    print('deleteBookmarkAnimal');
    DBAnimal().deleteWhereName(widget.animal.name);
    checkAnimal();
  }

  @override
  void initState() {
    checkAnimal();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Page'),
        titleSpacing: 0,
        actions: [
          IconButton(
            onPressed: (){
               _isBookmarked = !_isBookmarked;
              if (_isBookmarked) {
                addBookmarkAnimal();
              } else {
                deleteBookmarkAnimal();
              }
            },
            icon: Icon(_isBookmarked? Icons.bookmark : Icons.bookmark_border)
          )
        ],
      ),
      body: ListView(
        children: [
          Hero(
          tag: widget.animal.image+"from_grid_to_detail",
            child: Image.asset(
              widget.animal.image,
              fit: BoxFit.contain,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.animal.name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(widget.animal.move),
                SizedBox(
                  height: 4,
                ),
                Text('${widget.animal.weight} Kg'),
              ],
            ),
          ),
          SizedBox(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: listAnimal.length,
              itemBuilder: (context, index) {
                var hAnimal = Animal();
                hAnimal = listAnimal[index];
                // Animal hAnimal = listAnimal[index];
                return item(hAnimal, index);
              },
            ),
          )
        ],
      ),
    );
  }

  Widget item(Animal hAnimal, int index) {
    return Container(
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(30), boxShadow: [
        BoxShadow(
          offset: Offset(5, 5),
          blurRadius: 6,
          color: Colors.blue[100],
        )
      ]),
      margin: EdgeInsets.fromLTRB(
        index == 0?16:8,
        16,
        index == listAnimal.length-1?16:8,
        16,
      ),
      width: 150,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Image.asset(
          hAnimal.image,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
