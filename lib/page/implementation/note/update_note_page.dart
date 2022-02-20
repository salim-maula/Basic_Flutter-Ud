
import 'package:flutter/material.dart';
import 'package:flutter_only/db/db_note.dart';
import 'package:flutter_only/model/note.dart';

class UpdateNotePage extends StatefulWidget {
  final Note note;

  const UpdateNotePage({Key key, @required this.note}) : super(key: key);
  @override
  State<UpdateNotePage> createState() => _UpdateNotePageState();
}

class _UpdateNotePageState extends State<UpdateNotePage> {
  var _controllerTitle = TextEditingController();

  var _controllerBody = TextEditingController();

  var _formKey = GlobalKey<FormState>();

  void updateNote() async {
    if (_formKey.currentState.validate()) {
      Note newNote = Note(
        id: widget.note.id,
        body: _controllerBody.text,
        date: DateTime.now().toIso8601String(),
        title: _controllerTitle.text,
      );
      int id = await DBNote().updateWhereId(newNote);
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
  void initState() {
    _controllerTitle.text = widget.note.title ?? '';
    _controllerBody.text = widget.note.body ?? '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Update Note'), titleSpacing: 0),
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
              onPressed: () => updateNote(),
              child: const Text('Update'),
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
