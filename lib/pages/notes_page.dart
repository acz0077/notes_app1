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
      builder:
          (context) => AlertDialog(
            title: const Text("Add New Note"),
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
          ),
    );
  }

  // user wants to update note
  void updateNote(Note note) {
    //pre-fill text controller with exiting note
    noteController.text = note.content;

    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text("Update Note"),
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
              // update button
              TextButton(
                onPressed: () {
                  // update in db
                  notesDatabase.updateNote(note, noteController.text);

                  Navigator.pop(context);
                  noteController.clear();
                },
                child: const Text("Update"),
              ),
            ],
          ),
    );
  }

  // user wants to delete note
  void deleteNote(Note note) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text("Delete Note"),
            actions: [
              // cancel button
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  noteController.clear();
                },
                child: const Text("Cancel"),
              ),
              // delete button
              TextButton(
                onPressed: () {
                  // delete from db
                  notesDatabase.deleteNote(note);

                  Navigator.pop(context);
                },
                child: const Text("Delete"),
              ),
            ],
          ),
    );
  }

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

      //Body -> StreamBuilder
      body: StreamBuilder(
        // listens ti this stream..
        stream: notesDatabase.stream,

        // to build our UI..
        builder: (context, snapshot) {
          // loading..
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          // loaded!
          final notes = snapshot.data as List<Note>;

          // list of notes UI
          if (notes.isEmpty) {
            return const Center(child: Text("No notes yet."));
          }
          return ListView.builder(
            itemCount: notes.length,
            itemBuilder: (context, index) {
              // get each note
              final note = notes[index];

              // list tile UI
              return ListTile(
                title: Text(note.content),
                trailing: SizedBox(
                  width: 100,
                  child: Row(
                    children: [
                      // update button
                      IconButton(
                        onPressed: () => updateNote(note),
                        icon: const Icon(Icons.edit),
                      ),
                      // delete button
                      IconButton(
                        onPressed: () => deleteNote(note),
                        icon: const Icon(Icons.delete),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
