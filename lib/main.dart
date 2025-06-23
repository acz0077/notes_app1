import 'package:flutter/material.dart';
import 'package:notes_app1/pages/notes_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  await Supabase.initialize(
    url: 'https://lsuizwyqngywetzjsvxn.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImxzdWl6d3lxbmd5d2V0empzdnhuIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTA1OTY1NDksImV4cCI6MjA2NjE3MjU0OX0.2KnLrFRpcZ7EZkT3WpLeeZ1iOkjrw-b2wOThny9WtWE',
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NotesPage(),
    );
  }
}
