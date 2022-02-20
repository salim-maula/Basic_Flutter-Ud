import 'package:flutter_only/db/db_note.dart';

class Note {
  int id;
  String title;
  String body;
  String date;

  Note({
    this.id,
    this.title,
    this.body,
    this.date,
  });

  factory Note.fromMap(Map<String, dynamic> map) => Note(
        id: map[DBNote.COLUMN_ID],
        title: map[DBNote.COLUMN_TITLE],
        body: map[DBNote.COLUMN_BODY],
        date: map[DBNote.COLUMN_DATE],
      );

  Map<String, dynamic> toMap() => {
        DBNote.COLUMN_TITLE: title,
        DBNote.COLUMN_BODY: body,
        DBNote.COLUMN_DATE: date,
      };
}
