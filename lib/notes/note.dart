class Note {
  // get ini for supabase elements

  int? id;
  String content;
  Note({required this.content, this.id});

  //convert from Map
  factory Note.fromMap(Map<String, dynamic> map) {
    return Note(id: map['id'] as int?, content: map['content'] as String);
  }

  //conver to Map
  Map<String, dynamic> toMap() {
    return {'id': id, 'content': content};
  }
}
