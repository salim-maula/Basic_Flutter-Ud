import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_only/model/game.dart';
import 'package:http/http.dart' as http;

class DetailGamePage extends StatefulWidget {
  final int idGame;

  const DetailGamePage({Key key, @required this.idGame}) : super(key: key);

  @override
  State<DetailGamePage> createState() => _DetailGamePageState();
}

class _DetailGamePageState extends State<DetailGamePage> {
  Game game;

  void getDetailGame() async {
    var url = 'https://www.freetogame.com/api/game?id=${widget.idGame}';
    try {
      var response = await http.get(Uri.parse(url));
      var responseBody = jsonDecode(response.body);
      game = Game.fromJson(responseBody);
    } catch (e) {
      print(e);
    }
    setState(() {});
  }

  @override
  void initState() {
    getDetailGame();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(game == null ? '' : game.title),
        titleSpacing: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          if (game != null)
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    game.thumbnail,
                    fit: BoxFit.cover,
                    width: 200,
                    height: 300,
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildTitle('Release'),
                      const SizedBox(height: 4),
                      Text(game.release_date ?? ''),
                      const SizedBox(height: 20),
                      buildTitle('Genre'),
                      const SizedBox(height: 4),
                      Text(game.genre ?? ''),
                      const SizedBox(height: 20),
                      buildTitle('Platform'),
                      const SizedBox(height: 4),
                      Text(game.platform ?? ''),
                      const SizedBox(height: 20),
                      buildTitle('Publisher'),
                      const SizedBox(height: 4),
                      Text(game.publisher ?? ''),
                      const SizedBox(height: 20),
                      buildTitle('Developer'),
                      const SizedBox(height: 4),
                      Text(game.developer ?? ''),
                    ],
                  ),
                ),
              ],
            ),
          const SizedBox(height: 20),
          if (game != null)
            Text(
              game.description ?? '',
              textAlign: TextAlign.justify,
            ),
          const SizedBox(height: 30),
          if (game != null)
            const Text(
              'Screenshots',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          const SizedBox(height: 16),
          if (game != null)
            SizedBox(
              height: 200,
              child: PageView(
                controller: PageController(
                  initialPage: 0,
                  viewportFraction: 0.8,
                ),
                children: game.screenshots.map((e) {
                  return Padding(
                    padding: const EdgeInsets.all(8),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        e.image,
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
        ],
      ),
    );
  }

  Widget buildTitle(String title) {
    return Text(
      '$title:',
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
    );
  }
}
