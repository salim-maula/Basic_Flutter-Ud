import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'detail_game_page.dart';

class GameGalleryPage extends StatelessWidget {
  Future<List<Map>> getAllGame() async {
    List<Map> listGame = [];
    var url = 'https://www.freetogame.com/api/games';
    try {
      var response = await http.get(Uri.parse(url));
      List responseBody = jsonDecode(response.body);
      responseBody.forEach((element) {
        listGame.add(element);
      });
    } catch (e) {
      print(e);
    }
    return listGame;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Game Gallery Page'), titleSpacing: 0),
      body: FutureBuilder(
        future: getAllGame(),
        builder: (context, AsyncSnapshot<List<Map>> snapshot) {
          if (snapshot.hasError) {
            return const Center(child: Text('Something Error'));
          }
          if (snapshot.hasData) {
            if (snapshot.data.isNotEmpty) {
              return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 0.8,
                    crossAxisSpacing: 4,
                    mainAxisSpacing: 4),
                itemBuilder: (context, index) {
                  Map game = snapshot.data[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailGamePage(
                            idGame: game['id'],
                          ),
                        ),
                      );
                    },
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        Image.network(
                          game['thumbnail'],
                          fit: BoxFit.cover,
                        ),
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Container(
                            color: Colors.black.withOpacity(0.5),
                            padding: EdgeInsets.all(4),
                            child: Text(
                              game['title'],
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            } else {
              return const Center(child: Text('Empty'));
            }
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
