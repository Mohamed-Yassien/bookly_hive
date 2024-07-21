import 'package:bookly_hive/utils/constants.dart';
import 'package:bookly_hive/views/notes_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(1000),
            side: BorderSide.none,
          ),
          backgroundColor: kPrimaryColor,
          foregroundColor: Colors.black,
        ),
      ),
      home: const NotesView(),
    );
  }
}
