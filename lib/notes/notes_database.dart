import 'package:notes_app1/notes/note.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class NotesDatabase {
  // get ini for Supabase
  final _db = Supabase.instance.client.from('notes');

  //create note
  Future createNote(Note newNote) async {
    await _db.insert(newNote.toMap());
  }

  //read note
  final stream = Supabase.instance.client
      .from('notes')
      .stream(primaryKey: ['id'])
      .map((data) => data.map((noteMap) => Note.fromMap(noteMap)).toList());

  //delete note
  Future deleteNote(Note note) async {
    await _db.delete().eq('id', note.id!);
  }

  //update note
  Future updateNote(Note oldNot, String newContent) async {
    await _db.update({'content': newContent}).eq('id', oldNot.id!);
  }
}
