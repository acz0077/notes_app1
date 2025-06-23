import 'package:flutter/material.dart';
import 'package:notes_app1/notes/note.dart';
import 'package:notes_app1/notes/notes_database.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({super.key});

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  final noteController = TextEditingController();
  final notesDatabase = NotesDatabase();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder:
                (context) => AlertDialog(
                  title: const Text('New Note'),
                  content: TextField(controller: noteController),
                  actions: [
                    TextButton(
                      onPressed: () {
                        // popthe page
                        Navigator.pop(context);
                      },
                      child: const Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: () {
                        // get newNote
                        final newNote = Note(content: noteController.text);

                        //save note
                        notesDatabase.createNote(newNote);

                        //pop the page
                        Navigator.pop(context);
                      },
                      child: const Text('Save'),
                    ),
                  ],
                ),
          );
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(title: const Text('Notes'), centerTitle: true),
      body: StreamBuilder(
        stream: notesDatabase.stream,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            // loading....
            return const Center(child: CircularProgressIndicator());
          }
          // if there is data => return list view of notes
          final notes = snapshot.data!;
          return ListView.builder(
            itemCount: notes.length,
            itemBuilder: (context, index) {
              final note = notes[index];
              return ListTile(title: Text(note.content));
            },
          );
        },
      ),
    );
  }
}
