import 'package:flutter/material.dart';
import 'package:notes_app1/notes/note.dart';
import 'package:notes_app1/notes/notes_database.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({super.key});

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  // notes db
  final notesDatabase = NotesDatabase();

  // text controller
  final noteController = TextEditingController();

  // user wants to add new note
  void addNewNote() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(),
      title: const Text("New Note"),
      content: TextField(controller: noteController),
      actions: [
        // cancel button
        TextButton(
          onPressed: () {
            Navigator.pop(context);
            noteController.clear();
          },
          child: const Text("Cancel"),
        ),
        // save button
        TextButton(
          onPressed: () {
            // create a new  note
            final newNote = Note(content: noteController.text);
            // save in db
            notesDatabase.createNote(newNote);

            Navigator.pop(context);
            noteController.clear();
          },
          child: const Text("Save"),
        ),
      ],
    );
  }

  // user wants to update note

  // user wants to delete note

  // BUILD UI
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // App Bar
      appBar: AppBar(title: const Text("Notes")),

      // Button
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
