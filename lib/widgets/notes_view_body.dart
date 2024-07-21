import 'package:bookly_hive/widgets/custom_app_bar.dart';
import 'package:bookly_hive/widgets/notes_item.dart';
import 'package:flutter/material.dart';

class NotesViewBody extends StatelessWidget {
  const NotesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          CustomAppBar(),
          SizedBox(
            height: 20,
          ),
          NotesItem(),
        ],
      ),
    );
  }
}
