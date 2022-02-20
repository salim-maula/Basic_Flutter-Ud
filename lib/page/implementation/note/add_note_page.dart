
import 'package:flutter/material.dart';
import 'package:flutter_only/db/db_note.dart';
import 'package:flutter_only/model/note.dart';

class AddNotePage extends StatefulWidget {
  @override
  State<AddNotePage> createState() => _AddNotePageState();
}

class _AddNotePageState extends State<AddNotePage> {
  var _controllerTitle = TextEditingController();

  var _controllerBody = TextEditingController();

  var _formKey = GlobalKey<FormState>();

  void addNote() async {
    if (_formKey.currentState.validate()) {
      Note note = Note(
        body: _controllerBody.text,
        date: DateTime.now().toIso8601String(),
        title: _controllerTitle.text,
      );
      int id = await DBNote().insertNote(note);
      if (id != null) {
        showNotif('Success');
      } else {
        showNotif('Failed');
      }
    }
  }

  void showNotif(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(milliseconds: 2500),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Note'), titleSpacing: 0),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            buildInput(_controllerTitle, 'Title'),
            const SizedBox(height: 16),
            buildInputArea(_controllerBody, 'Body'),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => addNote(),
              child: const Text('Add'),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildInput(TextEditingController controller, String label) {
    return TextFormField(
      controller: controller,
      validator: (value) => value == '' ? "Don't empty" : null,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      ),
    );
  }

  Widget buildInputArea(TextEditingController controller, String label) {
    return TextFormField(
      controller: controller,
      validator: (value) => value == '' ? "Don't empty" : null,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      ),
      minLines: 1,
      maxLines: 8,
    );
  }
}
