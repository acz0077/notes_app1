import 'package:flutter/material.dart';
import 'package:notes_app1/pages/notes_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  // supabase setup
  await Supabase.initialize(
    url: 'https://qpkwuplxqlsexegvhnxa.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InFwa3d1cGx4cWxzZXhlZ3ZobnhhIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTA5MTE0OTAsImV4cCI6MjA2NjQ4NzQ5MH0.7Z-ARHFSmKgNLVuSiyFSk6JduXTeSz903L1p5cYQfg0',
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: NotesPage());
  }
}
