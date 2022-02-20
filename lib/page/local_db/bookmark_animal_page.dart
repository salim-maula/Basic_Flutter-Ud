import 'package:flutter/material.dart';
import 'package:flutter_only/db/db_animal.dart';
import 'package:flutter_only/model/animal.dart';
import 'package:flutter_only/page/ui_list/detail_page.dart';

class BookmarkAnimalPage extends StatefulWidget {
  @override
  _BookmarkAnimalPageState createState() => _BookmarkAnimalPageState();
}

class _BookmarkAnimalPageState extends State<BookmarkAnimalPage> {
  List<Animal> _listAnimal = [];

  void getListAnimal() async {
    _listAnimal.clear();
    _listAnimal = await DBAnimal().getAllAnimal();
    setState(() {});
  }

  @override
  void initState() {
    getListAnimal();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bookmark Animal Page'),
        titleSpacing: 0,
      ),
      body: _listAnimal.isNotEmpty
          ? ListView.separated(
              itemCount: _listAnimal.length,
              separatorBuilder: (context, index) {
                return const Divider(height: 1, thickness: 1);
              },
              itemBuilder: (context, index) {
                Animal animal = _listAnimal[index];
                return ListTile(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return DetailPage(animal: animal);
                      },
                    )).then((value) => getListAnimal());
                  },
                  title: Text(animal.name),
                  trailing: const Icon(Icons.navigate_next),
                );
              },
            )
          : const Center(child: Text('Empty')),
    );
  }
}