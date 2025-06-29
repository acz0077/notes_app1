import 'package:notes_app1/notes/note.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class NotesDatabase {
  // Database -> notes
  final database = Supabase.instance.client.from('notes');

  // create note
  Future createNote(Note newNote) async {
    await database.insert(newNote.toMap());
  }

  // read note
  final stream = Supabase.instance.client
      .from('notes')
      .stream(primaryKey: ['id'])
      .map((data) => data.map((noteMap) => Note.fromMap(noteMap)).toList());

  // update note
  Future updateNote(Note oldNote, String newContent) async {
    await database.update({'content': newContent}).eq('id', oldNote.id!);
  }

  // delete note
  Future deleteNote(Note note) async {
    await database.delete().eq('id', note.id!);
  }

  void addNote(String text) {}
}
