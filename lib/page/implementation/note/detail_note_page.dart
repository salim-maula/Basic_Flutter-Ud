import 'package:flutter/material.dart';
import 'package:flutter_only/model/note.dart';
import 'package:intl/intl.dart';

class DetailNotePage extends StatelessWidget {
  final Note note;

  const DetailNotePage({Key key, @required this.note}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime date =
        note.date == null ? DateTime.now() : DateTime.parse(note.date);
    return Scaffold(
      appBar: AppBar(title: const Text('Detail Note'), titleSpacing: 0),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text(
            note.title ?? '',
            style: const TextStyle(
              fontSize: 18,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            DateFormat('d MMM yyyy').format(date),
            textAlign: TextAlign.justify,
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey[600],
            ),
          ),
          const SizedBox(height: 20),
          Text(
            note.body ?? '',
            textAlign: TextAlign.justify,
          ),
        ],
      ),
    );
  }
}
